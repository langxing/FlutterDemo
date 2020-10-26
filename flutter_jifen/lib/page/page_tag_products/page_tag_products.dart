import 'package:flutter/material.dart';
import 'package:flutter_jifen/constants.dart';
import 'package:flutter_jifen/page/page_tag_products/tag_products_model.dart';
import 'package:flutter_jifen/widget/widget_content.dart';
import 'package:provider/provider.dart';

class TagProductsPage extends StatefulWidget {
  final String keywords;
  final String title;
  final String tagId;
  final int type;

  static const PAGE_NAME = "tagProductsPage";
  static const PARAMS_KEYWORDS = "keywords";
  static const PARAMS_TITLE = "title";
  static const PARMAS_TAGID = "tagId";
  static const PARAMS_TYPE = "type";
  static const TYPE_SEARCH = 0;
  static const TYPE_TAG = 1;

  TagProductsPage({this.keywords, this.title, this.tagId, this.type});

  @override
  State<StatefulWidget> createState() {
    return TagProductsState();
  }

}

class TagProductsState extends State<TagProductsPage> {
  final _sortKey = GlobalKey();
  final _recommendKey = GlobalKey();
  final _model = TagProductsModel();
  final _sortNotifier = ValueNotifier(SORT_DEFAULT);
  final _searchController = TextEditingController();

  static const SORT_DEFAULT = 0;
  ///升序排序
  static const SORT_UP = 3;
  ///降序排序
  static const SORT_DOWN = 4;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.type == TagProductsPage.TYPE_TAG) {
      _model.loadProducts(tagId: widget.tagId);
    } else if(widget.keywords != null) {

    }
    _searchController.addListener(() {

    });
    final sortRender = _sortKey.currentContext.findRenderObject();
    final recommendRender = _recommendKey.currentContext.findRenderObject();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => _model)],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Consumer<TagProductsModel>(builder: (context, provider, child) => ContentWidget(
          pageState: provider.pageState,
          child: Column(
            children: [
              Visibility(
                  visible: widget.type == TagProductsPage.TYPE_SEARCH,
                  child: Container(
                    height: 30,
                    margin: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                    size: 12,
                                  ),
                                  Expanded(
                                      child: TextField(
                                        controller: _searchController,
                                      )
                                  ),
                                  Image.asset(
                                    "assets/images/icon_detail_img_close.png",
                                    fit: BoxFit.contain,
                                    width: 20,
                                    height: 20,
                                  )
                                ],
                              ),
                            )
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "搜索",
                              style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 15
                              ),
                            ),
                          ),
                          onTap: () {

                          },
                        )
                      ],
                    ),
                  )
              ),
              ValueListenableBuilder(
                  valueListenable: _sortNotifier,
                  builder: (context, value, child) => Stack(
                    children: [
                      Container(
                        height: 50,
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  key: _recommendKey,
                                  child: Text(
                                    "推荐",
                                    style: TextStyle(
                                        color: value == SORT_DEFAULT? Color(0xFF333333) : Color(0xFF999999),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                  onTap: () {
                                    if (_sortNotifier.value != SORT_DEFAULT) {
                                      _sortNotifier.value = SORT_DEFAULT;
                                    }
                                    provider.pageIndex = 1;
                                    provider.loadProducts(tagId: widget.tagId, sort: _sortNotifier.value);
                                  },
                                ),
                                InkWell(
                                  key: _sortKey,
                                  child: Row(
                                    children: [
                                      Text(
                                        "积分排序",
                                        style: TextStyle(
                                            color: value != SORT_DEFAULT? Color(0xFF333333) : Color(0xFF999999),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15
                                        ),
                                      ),
                                      Image.asset(
                                        _updateSort(value),
                                        fit: BoxFit.contain,
                                        width: 15,
                                        height: 15,
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    if (_sortNotifier.value != SORT_UP) {
                                      _sortNotifier.value = SORT_UP;
                                    } else {
                                      _sortNotifier.value = SORT_DOWN;
                                    }
                                    provider.pageIndex = 1;
                                    provider.loadProducts(tagId: widget.tagId, sort: _sortNotifier.value);
                                  },
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5)
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(12),
                        itemCount: provider.productList.length,
                        itemBuilder: (context, index) {
                          final item = provider.productList[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Row(
                              children: [
                                DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: BorderDirectional(
                                        top: BorderSide(
                                          color: Color(0xFFF5F5F5),
                                          width: 1
                                        ),
                                        start: BorderSide(
                                            color: Color(0xFFF5F5F5),
                                            width: 1
                                        ),
                                        bottom: BorderSide(
                                            color: Color(0xFFF5F5F5),
                                            width: 1
                                        ),
                                        end: BorderSide(
                                            color: Color(0xFFF5F5F5),
                                            width: 1
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(3)
                                    ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: FadeInImage(
                                      placeholder: AssetImage(defaultImage),
                                      image: NetworkImage(item.imgUrl),
                                      fit: BoxFit.contain,
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          item.productName,
                                          style: TextStyle(
                                              color: Color(0xFF333333),
                                              fontSize: 15
                                          ),
                                        ),
                                        Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: item.jifen,
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12
                                                  ),
                                                ),
                                                TextSpan(
                                                    text: "积分",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 12
                                                    )
                                                ),
                                                TextSpan(
                                                    text: (double.tryParse(item.price) ?? 0) > 0 ? "+" : "",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 12
                                                    )
                                                ),
                                                TextSpan(
                                                  text: (double.tryParse(item.price) ?? 0) > 0 ?
                                                  "${double.tryParse(item.price) ~/ 100}" : "",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12
                                                  ),
                                                ),
                                                TextSpan(
                                                    text: (double.tryParse(item.price) ?? 0) > 0 ? "元" : "",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 12
                                                    )
                                                )
                                              ]
                                            )
                                        )
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  )
              )
            ],
          ),
        )),
      ),
    );
  }

  ///根据排序，切换图标
  String _updateSort(int sort) {
    switch (sort) {
      case SORT_DEFAULT:
        return "assets/images/icon_sort_normal.png";
        break;
      case SORT_DOWN:
        return "assets/images/icon_sort_down.png";
        break;
      case SORT_UP:
        return "assets/images/icon_sort_up.png";
        break;
    }
    return "";
  }
}