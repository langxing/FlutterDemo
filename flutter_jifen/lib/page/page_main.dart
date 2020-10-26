import 'package:flutter/material.dart';
import 'package:flutter_jifen/page/home/page_home.dart';
import 'file:///D:/FlutterCode/flutter_jifen/lib/page/category/page_category.dart';
import 'file:///D:/FlutterCode/flutter_jifen/lib/page/mine/page_mine.dart';
import 'file:///D:/FlutterCode/flutter_jifen/lib/page/cart/page_shoppingcart.dart';

class MainPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }

}

class _MainState extends State<MainPage> {
  ValueNotifier _valueNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _valueNotifier,
        builder: (context, value, child) => Column(
          children: [
            Expanded(
                child: IndexedStack(
                  index: value,
                  children: [HomePage(), CategoryPage(), ShoppingCartPage(), MinePage()],
                )
            ),
            SizedBox(
              height: 50,
              child: BottomNavigationBar(
                selectedItemColor: Color(0xFFF54D4C),
                unselectedItemColor: Color(0xFFA1A1A1),
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 11,
                unselectedFontSize: 11,
                currentIndex: _valueNotifier.value,
                onTap: (index) {
                  debugPrint("$index");
                  _valueNotifier.value = index;
                },
                items: [
                        BottomNavigationBarItem(
                          icon: Image(
                          image: AssetImage("assets/images/icon_home_normal.png"),
                          width: 20,
                          height: 20,
                          ),
                          activeIcon: Image(
                          image: AssetImage('assets/images/icon_home_press.png'),
                          width: 20,
                          height: 20,
                          ),
                          title: Text("首页")
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                          'assets/images/icon_category_normal.png',
                          width: 20,
                          height: 20,
                          ),
                          activeIcon: Image.asset(
                          'assets/images/icon_category_press.png',
                          width: 20,
                          height: 20,
                          ),
                          title: Text("分类"),
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                          'assets/images/icon_cart_normal.png',
                          width: 20,
                          height: 20,
                          ),
                          activeIcon: Image.asset(
                          'assets/images/icon_cart_press.png',
                          width: 20,
                          height: 20,
                          ),
                          title: Text("购物车"),
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                          'assets/images/icon_personal_normal.png',
                          width: 20,
                          height: 20,
                          ),
                          activeIcon: Image.asset(
                          'assets/images/icon_personal_press.png',
                          width: 20,
                          height: 20,
                          ),
                          title: Text("个人中心"),
                        )
                  ]
              )
            ),
          ],
        ),
      ),
    );
  }

}