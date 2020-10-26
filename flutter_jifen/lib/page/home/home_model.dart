import 'package:flutter/cupertino.dart';
import 'package:flutter_jifen/data/home_activity.dart';
import 'package:flutter_jifen/data/home_banner.dart';
import 'package:flutter_jifen/data/home_menu.dart';
import 'package:flutter_jifen/data/home_product_resp.dart';
import 'package:flutter_jifen/http/dio.dart';
import 'package:flutter_jifen/http/service/home_service.dart';
import 'package:flutter_jifen/widget/widget_content.dart';

class HomeModel with ChangeNotifier {
  final _service = HomeService(dio);
  final _menuData = List<MenuList>();
  final _bannerData = List<BannerList>();
  final _activityData = List<ActivityActive>();
  final _productList = List<HomeProductItem>();

  PageState _pageState = PageState.STATE_LOADING;
  PageState _productState = PageState.STATE_LOADING;
  ActivityActive _activeData;
  String tagName;
  String _tagId;
  int miniJiFen;
  int maxJiFen;

  List<ActivityActive> get activityData => _activityData;
  List<HomeProductItem> get productList => _productList;
  List<BannerList> get bannerData => _bannerData;
  ActivityActive get activeData => _activeData;
  PageState get productState => _productState;
  List<MenuList> get menuData => _menuData;
  PageState get pageState => _pageState;

  Future<void> getBanner(int position) async {
    final response = await _service.loadHomeBanner(position);
    _pageState = PageState.STATE_NOMAL;
    _bannerData.clear();
    _bannerData.addAll(response.data.bannerList);
    notifyListeners();
  }

  Future<void> getActiveIcons() async {
    final response = await _service.loadHomeMenu();
    _menuData.clear();
    _menuData.addAll(response.data.list);
    notifyListeners();
  }

  Future<void> getActivity() async {
    final res = await _service.loadHomeActivity();
    _activityData.clear();
    _activeData = res.data.active[0];
    res.data.active.removeAt(0);
    _activityData.addAll(res.data.active);
    notifyListeners();
  }

  Future<void> loadHomeSpecialList() async {
    final res = await _service.loadHomeSpecialList();
    _tagId = res.data.tagInfo.id;
    tagName = res.data.tagInfo.name;
  }

  Future<void> loadProductList(int pageIndex, void callback(List<HomeProductItem> data)) async {
    final params = {"tag_id": _tagId, "page": pageIndex, "page_size": 10};
    params["min_jifen"] = miniJiFen;
    params["max_jifen"] = maxJiFen;
    final res = await _service.loadProductList(params);
    if (pageIndex == 1) {
      _productList.clear();
      if (res.data.list != null && res.data.list.isNotEmpty) {
        _productState = PageState.STATE_NOMAL;
      } else {
        _productState = PageState.STATE_EMPTY;
      }
    }
    _productList.addAll(res.data.list);
    callback(res.data.list);
    notifyListeners();
  }

  Future<void> getActiveTopics() async {
    final response = await _service.loadHomeTopicMenus();
  }
}