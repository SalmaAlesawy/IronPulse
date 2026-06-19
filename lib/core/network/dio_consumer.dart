import 'package:dio/dio.dart';
import 'package:fitness_app/core/errors/error_model.dart';
import 'package:fitness_app/core/errors/handle_exceptions.dart';
import 'package:fitness_app/core/network/api_consumer.dart';
import 'package:fitness_app/core/network/api_endpoints.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(Dio dio)
    : dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      print("DATA: ${e.response?.data}");
      print("STATUS: ${e.response?.statusCode}");
      print("HEADERS: ${e.response?.headers}");
      print("${dio.options.baseUrl}$path");

      throw ServerException(
        errModel: ErrorModel(
          errorMessage: e.response?.data.toString() ?? 'Unknown error',
          status: e.response?.statusCode ?? 500,
        ),
      );
    }
  }
}
