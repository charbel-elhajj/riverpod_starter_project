import 'package:dio/dio.dart';
import 'package:riverpod_starter_project/core/services/interfaces/i_http_client_service.dart';

class HttpClientService implements IHttpClientService {
  final Dio httpClient;
  final String url;
  final String? userAgent;
  final Map<String, dynamic>? headers;

  HttpClientService({
    required this.url,
    this.userAgent,
    this.headers,
    List<Interceptor> inteterceptors = const [],
  }) : httpClient = Dio(
          BaseOptions(
            baseUrl: url,
          ),
        )..interceptors.addAll(inteterceptors);

  Options _generateRequestionOptions(RequestOptions options) {
    if (headers != null) options.headers.addAll(headers!);
    if (userAgent != null) options.headers['User-Agent'] = userAgent;

    return Options(headers: options.headers);
  }

  @override
  Future<Response> post(RequestOptions options) {
    return httpClient.post(
      options.path,
      queryParameters: options.queryParameters,
      data: options.data,
      options: _generateRequestionOptions(options),
    );
  }

  @override
  Future<Response> patch(RequestOptions options) {
    return httpClient.patch(
      options.path,
      queryParameters: options.queryParameters,
      data: options.data,
      options: _generateRequestionOptions(options),
    );
  }

  @override
  Future<Response> put(RequestOptions options) {
    return httpClient.put(
      options.path,
      queryParameters: options.queryParameters,
      data: options.data,
      options: _generateRequestionOptions(options),
    );
  }

  @override
  Future<Response> get(RequestOptions options) {
    return httpClient.get(
      options.path,
      queryParameters: options.queryParameters,
      options: _generateRequestionOptions(options),
    );
  }

  @override
  Future<Response> delete(RequestOptions options) {
    return httpClient.delete(
      options.path,
      queryParameters: options.queryParameters,
      data: options.data,
      options: _generateRequestionOptions(options),
    );
  }
}
