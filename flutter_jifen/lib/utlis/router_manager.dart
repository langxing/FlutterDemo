
import 'package:flutter/material.dart';
import 'package:flutter_jifen/page/page_tag_products/page_tag_products.dart';

class RouterManager {

  static final Map<String, WidgetBuilder> routes = {
    TagProductsPage.PAGE_NAME: (context) => TagProductsPage(),
  };
}