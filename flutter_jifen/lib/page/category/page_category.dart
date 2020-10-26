import 'package:flutter/material.dart';
import 'package:flutter_jifen/constants.dart';
import 'package:flutter_jifen/data/category_list_resp.dart';
import 'package:flutter_jifen/data/category_product_list_resp.dart';
import 'package:flutter_jifen/page/category/category_model.dart';
import 'package:flutter_jifen/widget/widget_content.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoryPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CategoryState();
  }

}

class _CategoryState extends State<CategoryPage> {
  final _model = CategoryModel();
  final _tagController = ItemScrollController();
  final _productController = ItemScrollController();
  final _tagListener = ItemPositionsListener.create();
  final _productListener = ItemPositionsListener.create();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _model.getCategoryList();
    _productListener.itemPositions.addListener(() {
      final first = _productListener.itemPositions.value.first.index;
      _model.updateCategoryItemCheck(_model.categoryProductList[first]);
      _tagController.jumpTo(index: first);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _model,)
      ],
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
                backgroundColor: Colors.white,
                title: Text("分类", style: TextStyle(color: Colors.black, fontSize: 18),),
                centerTitle: true
            ),
            Divider(height: 0.1, color: Colors.grey[10],),
            Expanded(
              child: ContentWidget(
                pageState: _model.contentPageState,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Consumer<CategoryModel>(
                    builder: (context, provider, child) => Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Expanded(
                            flex: 1,
                            ///ListView头部有一段空白区域，是因为当ListView没有和AppBar一起使用时，头部会有一个padding
                            ///https://blog.csdn.net/codekxx/article/details/100887073
                            child: MediaQuery.removePadding(
                              removeTop: true,
                              context: context,
                              child: ListView.builder(
                                  itemCount: provider.categoryList.length,
                                  itemBuilder: (context, index) => InkWell(
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: _buildCategoryColor(provider.categoryList[index])
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(
                                            width: 3,
                                            height: 20,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(2),
                                                color: _bulidLineColor(provider.categoryList[index]),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              provider.categoryList[index].name,
                                              textAlign: TextAlign.center,
                                              style: _buildTextStyle(provider.categoryList[index]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      final item = provider.categoryList[index];
                                      provider.getCategoryProducts(item.id);
                                      provider.updateCategoryCheck(item);
                                    },
                                  )
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: ContentWidget(
                                pageState: _model.productPagestate,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 22,
                                        margin: EdgeInsets.symmetric(vertical: 3),
                                        child: ScrollablePositionedList.builder(
                                            itemScrollController: _tagController,
                                            itemPositionsListener: _tagListener,
                                            itemCount: provider.categoryProductList.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) => InkWell(
                                              child: Center(
                                                child: Container(
                                                  height: double.infinity,
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(right: 10),
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(3),
                                                    color: _buildProductcolor(provider.categoryProductList[index], Colors.redAccent, Color(0xFFE3E3E3))
                                                  ),
                                                  child: Text(
                                                    provider.categoryProductList[index].name,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: _buildProductcolor(provider.categoryProductList[index], Colors.white, Colors.black),
                                                        fontSize: 12
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                _productController.jumpTo(index: index);
                                                provider.updateCategoryItemCheck(provider.categoryProductList[index]);
                                              },
                                            )
                                        ),
                                      ),
                                      Expanded(
                                          child: MediaQuery.removePadding(
                                            removeTop: true,
                                            context: context,
                                            child: ScrollablePositionedList.builder(
                                                itemScrollController: _productController,
                                                itemPositionsListener: _productListener,
                                                itemCount: provider.categoryProductList.length,
                                                itemBuilder: (context, index) => Column(
                                                  children: [
                                                    Container(
                                                      height: 20,
                                                      width: double.infinity,
                                                      padding: EdgeInsets.only(left: 20),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFE5E5E5)
                                                      ),
                                                      child: Text(
                                                        provider.categoryProductList[index].name,
                                                        style: TextStyle(color: Colors.grey, fontSize: 12),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(vertical: 5),
                                                      child: Visibility(
                                                          visible: provider.categoryProductList[index].productList.isNotEmpty,
                                                          child: ListView.builder(
                                                              shrinkWrap: true,
                                                              physics:NeverScrollableScrollPhysics(),//禁用滑动事件
                                                              itemCount: provider.categoryProductList[index].productList.length,
                                                              itemBuilder: (context, position) => SizedBox(
                                                                height: 80,
                                                                child: Row(
                                                                  children: [
                                                                    FadeInImage(
                                                                        placeholder: AssetImage(defaultImage),
                                                                        image: NetworkImage(provider.categoryProductList[index].productList[position].imgList[0]),
                                                                        fit: BoxFit.contain,
                                                                        width: 80,
                                                                        height: 80
                                                                    ),
                                                                    Expanded(
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            provider.categoryProductList[index].productList[position].productName,
                                                                            maxLines: 1,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold
                                                                            ),
                                                                          ),
                                                                          RichText(
                                                                            text: TextSpan(
                                                                              children: <InlineSpan>[
                                                                                TextSpan(
                                                                                    text: "${provider.categoryProductList[index].productList[position].jifen}",
                                                                                    style: TextStyle(color: Colors.red, fontSize: 15)
                                                                                ),
                                                                                TextSpan(
                                                                                  text: "积分",
                                                                                  style: TextStyle(color: Colors.red, fontSize: 12)
                                                                                )
                                                                              ]
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ))
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              )
                          )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _buildProductcolor(CategoryProductCategoryItem item, Color checkedColor, Color nomalColor) {
    if (item.isChecked) {
      return checkedColor;
    } else {
      return nomalColor;
    }
  }

  ///根据选中状态，设置分类item背景颜色
  Color _buildCategoryColor(CategoryItem data) {
    if (data.isChecked) {
      return Colors.white;
    } else {
      return Colors.grey[50];
    }
  }

  ///根据选中状态，更新左侧线的颜色
  Color _bulidLineColor(CategoryItem data) {
    if (data.isChecked) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  ///根据选中状态，更新文字style
  TextStyle _buildTextStyle(CategoryItem data) {
    if (data.isChecked) {
      return TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 15,
      );
    } else {
      return TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 15,
      );
    }
  }
}