import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jifen/data/home_activity.dart';
import 'package:flutter_jifen/data/home_menu.dart';
import 'package:flutter_jifen/data/home_product_resp.dart';
import 'package:flutter_jifen/page/page_tag_products/page_tag_products.dart';
import 'package:flutter_jifen/utlis/global.dart';
import 'package:flutter_jifen/widget/widget_content.dart';
import 'package:flutter_jifen/widget/widget_empty.dart';
import 'package:flutter_jifen/widget/widget_loading.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tuple/tuple.dart';

import '../../constants.dart';
import 'home_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  final _scrollController = ScrollController();
  final double _appbarHeight = 75;
  final _model = HomeModel();
  ///监听精选好物tab切换
  final ValueNotifier<String> _valueNotifier = ValueNotifier("全部");
  final ValueNotifier<double> _percentNotifier = ValueNotifier(0);
  final Map<String, Tuple2<int,int>> _tagMap = {
    "全部": Tuple2(-1, -1),
    "1-100": Tuple2(1, 100),
    "101-300": Tuple2(101, 300),
    "300以上": Tuple2(300, -1),
  };
  RefreshController _refreshController;
  int pageIndex = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _model.miniJiFen = _tagMap["全部"].item1;
    _model.maxJiFen = _tagMap["全部"].item2;
    _scrollController.addListener(() {
      final pixels = _scrollController.offset;
      _percentNotifier.value = pixels > _appbarHeight? 1.0 : pixels < 0? 0.0 : pixels / _appbarHeight;
    });
    _refreshController = RefreshController(initialRefresh: false);
    load();
    _refreshController.refreshCompleted();
  }

  Future<void> _onRefresh() async {
    pageIndex = 1;
    _refreshController.resetNoData();
    load();
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    _model.loadProductList(pageIndex, (data) {
      if ((pageIndex > 1 && (data == null || data.isEmpty)) || (data != null && data.length < 10)) {
        _refreshController.loadNoData();
      }
    });
    _refreshController.loadComplete();
    pageIndex ++;
  }

  Future<void> load() async {
    await Future.wait([
      _model.getBanner(1),
      _model.getActiveIcons(),
      _model.getActiveTopics(),
      _model.getActivity(),
      _model.loadHomeSpecialList().then((value) => _model.loadProductList(pageIndex, (data) {
        if ((pageIndex > 1 && (data == null || data.isEmpty)) || (data != null && data.length < 10)) {
          _refreshController.loadNoData();
        }
      }))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _model,)
      ],
      child: Scaffold(
        body: Consumer<HomeModel>(
          builder: (context, provider, child) => ContentWidget(
            pageState: provider.pageState,
            loadingWidget: LoadingWidget(),
            child: Stack(
              children: [
                SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  controller: _refreshController,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 180,
                          child: Swiper(
                            itemCount: provider.bannerData.length,
                            itemBuilder: (context, index) => FadeInImage(
                              placeholder: AssetImage(defaultImage),
                              image: NetworkImage(provider.bannerData[index].imgUrl),
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            autoplay: true,
                          ),
                        ),
                      ),
                      SliverGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 1.3,
                        children: _builderGrid(provider.menuData),
                      ),
                      SliverToBoxAdapter(
                        child: Visibility(
                          visible: provider.activeData != null,
                          child: Column(
                            children: [
                              FadeInImage(
                                placeholder: AssetImage(defaultImage),
                                image:
                                    NetworkImage(provider.activeData?.imgUrl ?? ""),
                                fit: BoxFit.contain,
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    color: Color(hexToColor(
                                        provider.activeData?.bgColor ?? "#ffffff"))),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: _buildActivity(provider.activityData),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ValueListenableBuilder(
                            valueListenable: _valueNotifier,
                            builder: (context, value, child) =>_buildProductListHeader(value)
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ContentWidget(
                            pageState: provider.productState,
                            emptyWidget: EmptyWidget(height: 150,),
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2 / 2.6,
                              physics: NeverScrollableScrollPhysics(),
                              children: _buildProductList(provider.productList),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                _buildTitlebar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///构建商品列表
  List<Widget> _buildProductList(List<HomeProductItem> data) {
    final widgets = List<Widget>();
    if (data != null && data.isNotEmpty) {
      data.forEach((element) {
        widgets.add(Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: FadeInImage(
                  placeholder: AssetImage(defaultImage),
                  image: NetworkImage(element.imgUrl),
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  element.productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    height: 1
                  ),
                ),
              ),
              Visibility(
                visible: element.recommandContent.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                  child: Text(
                    element.recommandContent,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 10),
                  ),
                ),
              ),
              Container(
                height: 20,
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                padding: EdgeInsets.only(left: 6, top: 3, right: 6, bottom: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border(
                      top: BorderSide(color: Colors.red),
                      left: BorderSide(color: Colors.red),
                      bottom: BorderSide(color: Colors.red),
                      right: BorderSide(color: Colors.red),
                    )
                ),
                child: Text(
                  element.discountList[0].discountName,
                  style: TextStyle(color: Colors.red, fontSize: 8),
                ),
              ),
            ],
          ),
        ));
      });
    }
    return widgets;
  }

  Color _getBGColor(String value, String title) {
    if (value == title) {
      return Colors.deepOrangeAccent;
    } else {
      return Colors.grey;
    }
  }

  Color _getTxtColor(String value, String title) {
    if (value == title) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Widget _buildProductListHeader(String value) {
    final _widgets = List<Widget>();
    _tagMap.forEach((key, val) {
      _widgets.add(
          InkWell(
            child: Container(
              height: 30,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: _getBGColor(value, key),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Text(
                key,
                style: TextStyle(color: _getTxtColor(value, key), fontSize: 12),
              ),
            ),
            onTap: () {
              pageIndex = 1;
              final items = _tagMap[key];
              _model.miniJiFen = items.item1;
              _model.maxJiFen = items.item2;
              _refreshController.resetNoData();
              _model.loadProductList(pageIndex, (data) {
                if ((pageIndex > 1 && (data == null || data.isEmpty)) || (data != null && data.length < 10)) {
                  _refreshController.loadNoData();
                }
              });
              _valueNotifier.value = key;
            },
          )
      );
    });
    return Column(
      children: [
        Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Color(0xF5F5F5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/icon_home_choice.png"),
                width: 30,
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "精选好物",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _widgets,
          ),
        )
      ],
    );
  }

  ///顶部标题栏
  Widget _buildTitlebar() {
    return ValueListenableBuilder(
      valueListenable: _percentNotifier,
      builder: (_, value, child) => Container(
        height: _appbarHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [_computeColor(const Color(0xFFFF592E), value), _computeColor(const Color(0xFFFD2344), value)]
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 30),
              child: Image(
                image: AssetImage("assets/images/icon_home_search.png"),
                fit: BoxFit.contain,
                width: 25,
                height: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, top: 30),
              child: Image(
                image: AssetImage("assets/images/icon_customer.png"),
                fit: BoxFit.contain,
                width: 25,
                height: 25,
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _computeColor(Color color, double percent) {
    return Color.fromRGBO(color.red, color.green, color.blue, percent);
  }
  
  ///构建活动专区
  List<Widget> _buildActivity(List<ActivityActive> data) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _widgetList = List<Widget>();
    data.forEach((element) {
      final _widget = FadeInImage(
        placeholder: AssetImage(defaultImage),
        image: NetworkImage(element.imgUrl),
        fit: BoxFit.contain,
        width: _screenWidth / 2 - 15,
      );
      _widgetList.add(_widget);
    });
    return _widgetList;
  }

  ///构建金刚区
  List<Widget> _builderGrid(List<MenuList> data) {
    final _gridWidget = List<Widget>();
    data.forEach((element) {
      _gridWidget.add(
          InkWell(
            child: SizedBox(
              height: 75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: FadeInImage(
                      placeholder: AssetImage(defaultImage),
                      image: NetworkImage(element.imgUrl),
                      fit: BoxFit.fill,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Text(
                    element.title,
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                  TagProductsPage.PAGE_NAME,
                  arguments: {
                    TagProductsPage.PARMAS_TAGID: element.id,
                    TagProductsPage.PARAMS_TITLE: element.title,
                    TagProductsPage.PARAMS_TYPE: TagProductsPage.TYPE_TAG
                  });
            },
          )
      );
    });
    return _gridWidget;
  }
}
