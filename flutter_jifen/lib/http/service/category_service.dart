import 'package:dio/dio.dart';
import 'package:flutter_jifen/data/category_list_resp.dart';
import 'package:flutter_jifen/data/category_product_list_resp.dart';
import 'package:retrofit/http.dart';

part 'category_service.g.dart';

@RestApi()
abstract class CategoryService {
  factory CategoryService(Dio dio, {String baseUrl}) = _CategoryService;

  ///获取分类列表
  @POST("/jifen/product/category/list")
  @FormUrlEncoded()
  Future<CategoryListResp> loadCategoryList();

  ///获取分类商品列表
  @POST("/jifen/product/category/product")
  @FormUrlEncoded()
  Future<CategoryProductListResp> loadCategoryProductList(@Field("fid") String id);
}