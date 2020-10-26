
import 'package:flutter/cupertino.dart';
import 'package:flutter_jifen/data/home_product_resp.dart';
import 'package:flutter_jifen/http/dio.dart';
import 'package:flutter_jifen/http/service/home_service.dart';
import 'package:flutter_jifen/widget/widget_content.dart';

class TagProductsModel with ChangeNotifier {
  final _service = HomeService(dio);
  final _productList = List<HomeProductItem>();

  PageState _pageState = PageState.STATE_LOADING;
  int _pageIndex = 1;

  PageState get pageState => _pageState;
  List<HomeProductItem> get productList => _productList;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
  }

  Future<void> loadProducts({String tagId, String keywords, int sort}) async {
    final params = Map<String, dynamic>();
    HomeProductResp resp;
    params["page"] = _pageIndex;
    params["page_size"] = 10;
    params["sort"] = 0;
    if (sort != null) {
      params["sort"] = sort;
    }
    if (tagId != null && tagId.isNotEmpty) {
      params["tag_id"] = tagId;
    }
    if (keywords != null && keywords.isNotEmpty) {
      params["keywords"] = keywords;
      resp = await _service.querySearchList(params);
    } else {
      resp = await _service.loadProducts(params);
    }
    if (_pageIndex == 1) {
      _productList.clear();
    }
    _productList.addAll(resp.data.list);
    _pageState = PageState.STATE_NOMAL;
    _pageIndex ++;
    notifyListeners();
  }
}