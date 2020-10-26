
import 'package:flutter/cupertino.dart';
import 'package:flutter_jifen/data/cart_list_resp.dart';
import 'package:flutter_jifen/http/dio.dart';
import 'package:flutter_jifen/http/service/cart_service.dart';
import 'package:flutter_jifen/widget/widget_content.dart';
import 'package:tuple/tuple.dart';

class CartModel with ChangeNotifier {
  final _service = CartService(dio);
  final _cartList = List<CartItem>();
  double _totalPrice = 0;
  double _totalJifen = 0;

  PageState _pageState = PageState.STATE_LOADING;

  List<CartItem> get cartList => _cartList;
  PageState get pageState => _pageState;
  double get totalJifen => _totalJifen;
  double get totalPrice => _totalPrice;

  Future<void> getShoppingCart() async {
    final resp = await _service.loadCartList();
    _cartList.clear();
    _cartList.addAll(resp.data.normal);
    _pageState = PageState.STATE_NOMAL;
    notifyListeners();
  }

  Future<void> editCart(String skuId, int number) async {
    await _service.updateCartList(skuId, number);
  }

  ///全选和全不选
  void allChecked(bool isCheck) {
    _totalJifen = 0;
    _totalPrice = 0;
    _cartList.forEach((element) {
      element.isChecked = isCheck;
      element.skuList.forEach((item) {
        item.isChecked = isCheck;
        if (isCheck) {
          _totalJifen += int.parse(item.number) * double.parse(item.jifen);
          _totalPrice += int.parse(item.number) * (double.tryParse(item.price) ?? 0);
        }
      });
    });
    notifyListeners();
  }

  ///计算选中的商品积分和价格
  void updateCart({Tuple2<String, bool> cartItem, Tuple2<String, bool> skuItem}) {
    _totalJifen = 0;
    _totalPrice = 0;
    _cartList.forEach((element) {
      if (skuItem != null) {
        if (element.supplierId == cartItem.item1) {
          element.isChecked = true;
          element.skuList.forEach((item) {
            if (item.id == skuItem.item1) {
              item.isChecked = skuItem.item2;
            }
            element.isChecked = item.isChecked;
            if (item.isChecked) {
              _totalJifen += int.parse(item.number) * double.parse(item.jifen);
              _totalPrice += int.parse(item.number) * (double.tryParse(item.price) ?? 0);
            }
          });
        }
      } else {
        if (element.supplierId == cartItem.item1) {
          element.isChecked = cartItem.item2;
        }
        element.skuList.forEach((item) {
          item.isChecked = element.isChecked;
          if (item.isChecked) {
            _totalJifen += int.parse(item.number) * double.parse(item.jifen);
            _totalPrice += int.parse(item.number) * (double.tryParse(item.price) ?? 0);
          }
        });
      }
    });
    notifyListeners();
  }


}