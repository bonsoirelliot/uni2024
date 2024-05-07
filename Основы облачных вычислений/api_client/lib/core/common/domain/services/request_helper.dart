// ignore_for_file: avoid_annotating_with_dynamic


import 'package:api_client/core/common/data/models/base_response/base_response_model.dart';
import 'package:api_client/core/common/domain/services/request_handler.dart';

class RequestHelper {
  final RequestHandler requestHandler;

  RequestHelper({required this.requestHandler});

  Future<T> getObject<T>(
    String path, {
    T Function(Map<String, dynamic>)? fromJson,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await requestHandler.get<dynamic>(
      path,
      queryParameters: queryParameters,
    );

    final baseRes = BaseResponseModel.fromJson(response.data as Map<String, dynamic>);

    final obj = fromJson != null ? fromJson(baseRes.data as Map<String, dynamic>) : baseRes.data as T;

    return obj;
  }

  Future<List<T>> getListOfObjects<T>(
    String path, {
    T Function(Map<String, dynamic>)? fromJson,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await requestHandler.get<dynamic>(
      path,
      queryParameters: queryParameters,
    );

    final baseRes = BaseResponseModel.fromJson(response.data as Map<String, dynamic>);

    final list = (baseRes.data as List<dynamic>)
        .map((dynamic e) => fromJson != null ? fromJson(e as Map<String, dynamic>) : e as T)
        .toList();

    return list;
  }
}
