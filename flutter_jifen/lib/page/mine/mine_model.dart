
import 'package:flutter/cupertino.dart';
import 'package:flutter_jifen/data/mine_order_statistic_count_resp.dart';
import 'package:flutter_jifen/data/user_info.dart';
import 'package:flutter_jifen/http/dio.dart';
import 'package:flutter_jifen/http/service/mine_service.dart';
import 'package:flutter_jifen/widget/widget_content.dart';

class MineModel with ChangeNotifier {
  final _service = MineService(dio);
  PageState _pageState = PageState.STATE_LOADING;
  MineOrderStatisticData _orderStatistic;
  UserData _userInfo;

  UserData get userInfo => _userInfo;
  PageState get pageState => _pageState;
  MineOrderStatisticData get orderStatistic => _orderStatistic;

  Future<void> getUserInfo() async {
    final resp = await _service.queryUserInfo();
    _userInfo = resp.data;
    _pageState = PageState.STATE_NOMAL;
    notifyListeners();
  }

  Future<void> getOrderStatistic() async {
    final resp = await _service.queryOrderStatistic();
    _orderStatistic = resp.data;
    notifyListeners();
  }
}