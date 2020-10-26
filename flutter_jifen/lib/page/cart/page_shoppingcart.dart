import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jifen/constants.dart';
import 'package:flutter_jifen/data/goods_detail_resp.dart';
import 'package:flutter_jifen/data/user_info.dart';
import 'package:flutter_jifen/page/cart/cart_model.dart';
import 'package:flutter_jifen/page/mine/mine_model.dart';
import 'package:flutter_jifen/widget/round_button.dart';
import 'package:flutter_jifen/widget/widget_content.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ShoppingCartPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ShoppingCartState();
  }

}

class _ShoppingCartState extends State<ShoppingCartPage> {
  final _model = CartModel();
  final _mineModel = MineModel();
  final _allCheckValue = ValueNotifier(false);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _model.getShoppingCart();
    _mineModel.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _model,
        ),
        ChangeNotifierProvider(
          create: (context) => _mineModel,
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "购物车",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Consumer2<CartModel, MineModel>(
          builder: (context, provider, user, child) => ContentWidget(
            pageState: provider.pageState,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: provider.cartList.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  child: Image.asset(
                                    provider.cartList[index].isChecked? "assets/images/icon_check_positive.png" : "assets/images/icon_check_negative.png",
                                    fit: BoxFit.contain,
                                    width: 20,
                                    height: 20,
                                  ),
                                  onTap: () {
                                    final item = provider.cartList[index];
                                    provider.updateCart(cartItem: Tuple2(item.supplierId, !item.isChecked));
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    provider.cartList[index].sname,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ],
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              //不支持滚动
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: provider.cartList[index].skuList.length,
                                itemBuilder: (context, position) {
                                final item = provider.cartList[index].skuList[position];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        child: Image.asset(
                                          item.isChecked? "assets/images/icon_check_positive.png" : "assets/images/icon_check_negative.png",
                                          fit: BoxFit.contain,
                                          width: 20,
                                          height: 20,
                                        ),
                                        onTap: () {
                                          final cartItem = provider.cartList[index];
                                          final product = cartItem.skuList[position];
                                          product.isChecked = !product.isChecked;
                                          provider.updateCart(
                                              cartItem: Tuple2(cartItem.supplierId, cartItem.isChecked),
                                              skuItem: Tuple2(product.id, product.isChecked)
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 5),
                                        child: FadeInImage(
                                          placeholder: AssetImage(defaultImage),
                                          image: NetworkImage(item.imgUrl),
                                          fit: BoxFit.contain,
                                          width: 85,
                                          height: 85,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.productName,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              height: 20,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFE3E3E3),
                                                    borderRadius: BorderRadius.circular(3)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(3),
                                                  child: Text(
                                                    item.propertiesName,
                                                    style: TextStyle(
                                                        color: Color(0xFF999999),
                                                        fontSize: 12,
                                                        height: 1
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets.all(2),
                                                  margin: const EdgeInsets.only(right: 3, top: 5, bottom: 5),
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xFFFFE5E6),
                                                      borderRadius: BorderRadius.circular(2)
                                                  ),
                                                  child: Text(
                                                    "满减",
                                                    style: const TextStyle(fontSize: 10, color: const Color(0xFFF6272D), height: 1),
                                                  ),
                                                ),
                                                _builderDiscount(item.discountList),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "更多",
                                                        textAlign: TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 12,
                                                            height: 1
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 3),
                                                        child: Image.asset(
                                                          'assets/images/icon_right_arrow.png',
                                                          fit: BoxFit.fill,
                                                          width: 4,
                                                          height: 9,
                                                          color: const Color(0xFFF6272D),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  RichText(
                                                      text: TextSpan(
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
                                                  ),
                                                  RoundButton(int.parse(item.number), leftRadius: 2, rightRadius: 2, miniNumber: 1, maxNumber: 10, onClick: (number) {
                                                    item.number = "$number";
                                                    provider.editCart(item.id, number);
                                                  },)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                            )
                          ],
                        ),
                      )
                  ),
                ),
                _builderBottomWidget(user.userInfo, provider.totalJifen.toString(), provider.totalPrice, (isCheck) {
                  provider.allChecked(isCheck);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _builderDiscount(List<GoodDiscountCondition> data) {
    final strContent = StringBuffer();
    if (data.isNotEmpty) {
      data.forEach((element) {
        strContent.write(element.discountContent);
      });
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        strContent.toString(),
        style: TextStyle(
            color: Colors.black,
            fontSize: 14),
      ),
    );
  }

  Widget _builderBottomWidget(UserData user, String totalJifen, double totalPrice, Function(bool isCheck) callback) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                color: Color(0xFFF9F1E1)
            ),
            child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: "当前积分余额：",
                          style: TextStyle(
                              color: Color(0xFFDF9B1E),
                              fontSize: 12
                          )
                      ),
                      TextSpan(
                          text: user?.jifenBalance ?? "0",
                          style: TextStyle(
                              color: Color(0xFFDF9B1E),
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                          )
                      )
                    ]
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                children: [
                  ValueListenableBuilder(
                      valueListenable: _allCheckValue,
                      builder: (context, val, child) => InkWell(
                        child: Image.asset(
                          val? "assets/images/icon_check_positive.png" : "assets/images/icon_check_negative.png",
                          fit: BoxFit.contain,
                          width: 20,
                          height: 20,
                        ),
                        onTap: () {
                          _allCheckValue.value = !_allCheckValue.value;
                          callback(_allCheckValue.value);
                        },
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Text(
                      "全选",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  Text(
                    "合计:",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: totalJifen,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            TextSpan(
                                text: "积分",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14
                                )
                            ),
                            TextSpan(
                                text: totalPrice > 0 ? "+" : "",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12
                                )
                            ),
                            TextSpan(
                              text: totalPrice > 0 ?
                              "${totalPrice ~/ 100}" : "",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12
                              ),
                            ),
                            TextSpan(
                                text: totalPrice > 0 ? "元" : "",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12
                                )
                            )
                          ]
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "（不含运费）",
                      style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 14
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: SizedBox(
                            width: 65,
                            height: 30,
                            child: DecoratedBox(
                              decoration: (double.tryParse(totalJifen) ?? 0) <= 0 ?
                              BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(18)
                              )
                              :
                              BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(18)),
                                gradient: LinearGradient(colors: [Color(0xFFFF6B44), Color(0xFFFF2F54)]),
                              ),
                              child: Center(
                                child: Text(
                                  "去兑换",
                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            ///TOD0确认订单页面
                          },
                        ),
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}