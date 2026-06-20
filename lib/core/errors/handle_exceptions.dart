import 'package:dio/dio.dart';
import 'package:fitness_app/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});

  @override
  String toString() => errModel.errorMessage;
}

void handleDioExceptions(DioException e) {
  final errModel = _getErrorModel(e);

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errModel: errModel);
    case DioExceptionType.sendTimeout:
      throw ServerException(errModel: errModel);
    case DioExceptionType.receiveTimeout:
      throw ServerException(errModel: errModel);
    case DioExceptionType.badCertificate:
      throw ServerException(errModel: errModel);
    case DioExceptionType.cancel:
      throw ServerException(errModel: errModel);
    case DioExceptionType.connectionError:
      throw ServerException(errModel: errModel);
    case DioExceptionType.unknown:
      throw ServerException(errModel: errModel);
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException(errModel: errModel);
        case 401: //unauthorized
          throw ServerException(errModel: errModel);
        case 403: //forbidden
          throw ServerException(errModel: errModel);
        case 404: //not found
          throw ServerException(errModel: errModel);
        case 409: //cofficient
          throw ServerException(errModel: errModel);
        case 422: //  Unprocessable Entity
          throw ServerException(errModel: errModel);
        case 504: // Server exception
          throw ServerException(errModel: errModel);
      }
      throw ServerException(errModel: errModel);
  }
}

ErrorModel _getErrorModel(DioException e) {
  final responseData = e.response?.data;

  if (responseData is Map<String, dynamic>) {
    return ErrorModel.fromJson(responseData);
  }

  return ErrorModel(
    status: e.response?.statusCode ?? 0,
    errorMessage: e.message ?? 'Something went wrong',
  );
}
