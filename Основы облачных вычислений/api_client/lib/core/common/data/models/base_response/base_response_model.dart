// ignore_for_file: avoid_catches_without_on_clauses, depend_on_referenced_packages
import 'package:api_client/core/common/data/exceptions/access_exception.dart';
import 'package:api_client/core/common/data/exceptions/response_parse_exception.dart';
import 'package:api_client/core/common/data/exceptions/success_false.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()

/// Модель ответа на запрос
class BaseResponseModel {
  const BaseResponseModel({
    required this.data,
    required this.success,
    this.code,
    this.message,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    final code = json['code'] as int?;
    if (code == 401 || code == 403) {
      throw AccessException(
        'Ошибка доступа',
        StackTrace.current,
      );
    }

    if (json['success'] is! bool) {
      throw ResponseParseException(
        'Ответ от сервера не содержит success',
        StackTrace.current,
      );
    }

    if (json['success'] == false) {
      throw SuccessFalse(
        json['message'] as String? ?? 'Произошла ошибка',
        StackTrace.current,
      );
    }

    try {
      final res = _$BaseResponseModelFromJson(json);

      return res;
    } catch (e) {
      throw ResponseParseException('BaseResponseModel: $e');
    }
  }

  factory BaseResponseModel.empty() {
    return const BaseResponseModel(
      data: <dynamic>[],
      success: true,
    );
  }

  /// данные в ответе на запрос
  /// чаще всего бывает [Map] или [List]
  final dynamic data;

  /// результат выполнения запроса
  final bool success;

  /// некое сообщение
  /// обычно присутствует если [success] == false
  final String? message;

  final int? code;

  Map<String, dynamic> toJson() => _$BaseResponseModelToJson(this);
}