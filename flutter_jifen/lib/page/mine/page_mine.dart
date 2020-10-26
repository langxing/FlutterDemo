import 'package:flutter/material.dart';
import 'package:flutter_jifen/constants.dart';
import 'package:flutter_jifen/data/mine_order_statistic_count_resp.dart';
import 'package:flutter_jifen/data/user_info.dart';
import 'package:flutter_jifen/page/mine/mine_model.dart';
import 'package:flutter_jifen/widget/widget_content.dart';
import 'package:provider/provider.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineState();
  }
}

class _MineState extends State<MinePage> {
  final _model = MineModel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _model.getUserInfo();
    _model.getOrderStatistic();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => _model,)],
      child: Scaffold(
        body: Consumer<MineModel>(
          builder: (context, provider, child) => ContentWidget(
            pageState: provider.pageState,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/mine_head_bg.png"),
                    fit: BoxFit.contain,
                  ),
                  Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        title: Text(
                          "个人中心",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        centerTitle: true,
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Image.asset(
                              "assets/images/icon_mine_transparent_custom_service.png",
                              fit: BoxFit.contain,
                              width: 30,
                              height: 30,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            ClipOval(
                              child: FadeInImage(
                                placeholder: AssetImage(defaultImage),
                                image: NetworkImage(
                                    provider.userInfo?.avatarUrl ?? ""),
                                fit: BoxFit.contain,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Text(
                              provider.userInfo?.nickName ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      _builderCard(provider.userInfo),
                      _builderMyOrder(provider.orderStatistic),
                      _builderSetting()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _builderSetting() {
    Widget itemWidget(String image, String title) => SizedBox(
      height: 50,
      child: Row(
        children: [
          Image.asset(
            image,
            fit: BoxFit.contain,
            width: 18,
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(title, style: TextStyle(color: Colors.black, fontSize: 14),),
          ),
          Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/images/icon_right_arrow.png",
                  fit: BoxFit.contain,
                  width: 12,
                  height: 12,
                ),
              )
          )
        ],
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          itemWidget("assets/images/icon_mine_address.png", "地址管理"),
          Divider(color: Color(0xFFE5E5E5), height: 0.2,),
          itemWidget("assets/images/icon_mine_detail.png", "积分明细"),
          Divider(color: Color(0xFFE5E5E5), height: 0.2,),
          itemWidget("assets/images/icon_mine_customer.png", "兑吧客服"),
        ],
      ),
    );
  }

  Widget _builderMyOrder(MineOrderStatisticData data) {
    Widget itemWidget(String data, String image, String title) {
      double opacity = 0;
      if (data != null && data != "" && data != "0") {
        opacity = 1;
      }
      return Expanded(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.contain,
                  width: 35,
                  height: 35,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                )
              ],
            ),
            Opacity(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 18,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        data,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ),
              opacity: opacity,
            ),
          ],
        ),
        flex: 1,
      );
    }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 12, right: 12),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "我的订单",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          Divider(
            color: Color(0xFFE5E5E5),
            height: 0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              children: [
                itemWidget(data.waitPay ?? "10", "assets/images/icon_wait_payment.png", "待支付"),
                itemWidget(data.waitSend ?? "", "assets/images/icon_wait_receiving.png", "待发货"),
                itemWidget(data.waitConfirm ?? "99+", "assets/images/icon_wait_deliver.png", "待收货"),
                itemWidget("", "assets/images/icon_completed.png", "已完成")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _builderCard(UserData userInfo) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.only(left: 12, top: 18, right: 12, bottom: 18),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/my_icon_card_bg.png"),
              fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "超盟通积分",
                      style: TextStyle(
                          color: Color(0xFF573727),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      "assets/images/my_icon_integral_r.png",
                      fit: BoxFit.contain,
                      width: 18,
                      height: 18,
                    )
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "规则",
                      style: TextStyle(color: Color(0xFF573727), fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Image.asset(
                        "assets/images/icon_mine_rule.png",
                        fit: BoxFit.contain,
                        width: 12,
                        height: 12,
                      ),
                    )
                  ],
                ),
                flex: 1,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              userInfo?.jifenBalance ?? "0",
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFF573727),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "累计获取积分",
                      style: TextStyle(color: Color(0xFF573727), fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(userInfo?.jifenTotal ?? "0",
                          style: TextStyle(
                              color: Color(0xFF573727),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                flex: 1,
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    "未入账积分",
                    style: TextStyle(color: Color(0xFF573727), fontSize: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(userInfo?.todayJifen ?? "0",
                        style: TextStyle(
                            color: Color(0xFF573727),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              ))
            ],
          )),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 0.5,
                  color: const Color(0x1f573727),
                ),
              ),
              Text(
                '积分当钱花，好货带回家',
                style: const TextStyle(
                    color: const Color(0x4f573727), fontSize: 12),
              ),
              Expanded(
                child: Container(
                  height: 0.5,
                  color: const Color(0x1F573727),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
