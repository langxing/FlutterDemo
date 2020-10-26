
import 'package:flutter/material.dart';
import 'package:flutter_jifen/data/category_list_resp.dart';
import 'package:flutter_jifen/data/category_product_list_resp.dart';
import 'package:flutter_jifen/http/dio.dart';
import 'package:flutter_jifen/http/service/category_service.dart';
import 'package:flutter_jifen/widget/widget_content.dart';

class CategoryModel with ChangeNotifier {
  final _categoryProductList = List<CategoryProductCategoryItem>();
  final CategoryService _service = CategoryService(dio);
  final _categoryList = List<CategoryItem>();

  PageState _contentPageState = PageState.STATE_LOADING;
  PageState _productPateState = PageState.STATE_LOADING;

  PageState get contentPageState => _contentPageState;
  PageState get productPagestate => _productPateState;
  List<CategoryItem> get categoryList => _categoryList;
  List<CategoryProductCategoryItem> get categoryProductList => _categoryProductList;

  Future<void> getCategoryList() async {
    final resp = await _service.loadCategoryList();
    _categoryList.clear();
    _categoryList.addAll(resp.data);
    _categoryList.forEach((element) {
      element.isChecked = false;
    });
    _categoryList[0].isChecked = true;
    _contentPageState = PageState.STATE_NOMAL;
    notifyListeners();
    getCategoryProducts(_categoryList[0].id);
  }

  Future<void> getCategoryProducts(String categoryId) async {
    _productPateState = PageState.STATE_LOADING;
    final resp = await _service.loadCategoryProductList(categoryId);
    _categoryProductList.clear();
    _categoryProductList.addAll(resp.data);
    resp.data.forEach((element) {
      if (element.productList == null || element.productList.isEmpty) {
        _categoryProductList.remove(element);
      } else {
        element.isChecked = false;
      }
    });
    _categoryProductList[0].isChecked = true;
    _productPateState = PageState.STATE_NOMAL;
    notifyListeners();
  }

  void updateCategoryItemCheck(CategoryProductCategoryItem item) {
    _categoryProductList.forEach((element) {
      if (element.id == item.id) {
        element.isChecked = true;
      } else {
        element.isChecked = false;
      }
      notifyListeners();
    });
  }

  void updateCategoryCheck(CategoryItem item) {
    _categoryList.forEach((element) {
      if (element.id == item.id) {
        element.isChecked = true;
      } else {
        element.isChecked = false;
      }
    });
    notifyListeners();
  }

}