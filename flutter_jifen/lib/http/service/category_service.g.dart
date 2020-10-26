// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CategoryService implements CategoryService {
  _CategoryService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  loadCategoryList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/jifen/product/category/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = CategoryListResp.fromJson(_result.data);
    return value;
  }

  @override
  loadCategoryProductList(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'fid': id};
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/jifen/product/category/product',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = CategoryProductListResp.fromJson(_result.data);
    return value;
  }
}
