import 'package:dio/dio.dart';

abstract class IHttpClientService {
  Future<Response> post(RequestOptions options);
  Future<Response> patch(RequestOptions options);
  Future<Response> put(RequestOptions options);
  Future<Response> get(RequestOptions options);
  Future<Response> delete(RequestOptions options);
}
