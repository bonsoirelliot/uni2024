// ignore_for_file: avoid_catches_without_on_clauses, no_leading_underscores_for_local_identifiers, unnecessary_statements, prefer_function_declarations_over_variables
import 'dart:async';
import 'package:api_client/core/common/data/exceptions/access_exception.dart';
import 'package:api_client/core/common/data/exceptions/custom_exception.dart';
import 'package:api_client/core/common/data/exceptions/response_parse_exception.dart';
import 'package:api_client/core/common/data/exceptions/success_false.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Executor {
  // final UserEntity userEntity;

  // Executor({required this.userEntity});

  final logger = Logger(
    printer: PrettyPrinter(),
  );

  /// Функция, в которую следует обернуть отправку запроса
  ///
  /// [processing] - наша функция, которую мы оборачиваем;
  ///А
  /// [dioErrorText], [responseParseErrorText], [successFalseErrorText], [otherErrorText] - тексты ошибок;
  ///
  /// [before] - коллбек, который запускается единожды перед запуском [processing];
  ///
  /// [after] - коллбек, который запускается всегда единожды после [processing], но до [onError] и [onSuccess];
  ///
  /// [onSuccess] - коллбек, который запускается если не была отловлена никакая ошибка;
  ///
  /// [onError] - коллбек, который запускается если была отловлена ошибка;
  ///
  /// [maxAttempts] - количество попыток. По-дефолту: 1;
  ///
  /// [attemptsDelayCallback] - коллбекс с задержкой между попытками.
  /// При вызове прокидывает текущую попытку и на основании ее можно уменьшать
  /// или увеличивать количество времени на попытку.
  /// По-дефолту: const Duration(milliseconds: 250);
  Future<void> execute<T>(
    Future<T> Function() processing, {
    String? dioErrorText,
    String? responseParseErrorText,
    String? successFalseErrorText,
    String? otherErrorText,
    FutureOr<void> Function()? before,
    FutureOr<void> Function()? after,
    FutureOr<void> Function(T? data)? onSuccess,
    FutureOr<void> Function(CustomException e)? onError,
    int maxAttempts = 1,
    Duration Function(int attempt)? attemptsDelayCallback,
    bool printError = true,
  }) async {
    final _attemptsDelay = attemptsDelayCallback ?? _defaultAttemptsDelay;

    CustomException? ex;
    T? data;
    int currentAttempt = 0;

    await before?.call();
    while (currentAttempt < maxAttempts) {
      (data, ex) = await _process<T>(
        processing,
        dioErrorText: dioErrorText,
        responseParseErrorText: responseParseErrorText,
        successFalseErrorText: successFalseErrorText,
        otherErrorText: otherErrorText,
      );

      currentAttempt += 1;

      if (currentAttempt == maxAttempts || ex == null) {
        // Мы выходим после достижения последней попытки,
        // либо если у нас запрос отработал без ошибок
        break;
      }

      await Future<void>.delayed(_attemptsDelay(currentAttempt));
    }

    await after?.call();

    if (ex != null) {
      if (printError) {
        logger.e(
          '${ex.title}: ${ex.subtitle}',
          stackTrace: ex.stackTrace,
          error: ex,
        );
      }
      await onError?.call(ex);
    } else {
      await onSuccess?.call(data);
    }
  }

  /// Дефолтная заглушка для задержки между попытками.
  ///
  /// Между каждой попыткой задержка будет 500ms
  final Duration Function(int attempt) _defaultAttemptsDelay =
      (attempt) => const Duration(milliseconds: 500);

  /// Функция, которая производит один вызов [processing] и ее обработку от ошибок
  ///
  /// Используется в [execute], чтобы выполнить некоторое заданное количество раз
  Future<(T?, CustomException?)> _process<T>(
    Future<T> Function() processing, {
    String? dioErrorText,
    String? responseParseErrorText,
    String? successFalseErrorText,
    String? otherErrorText,
  }) async {
    CustomException? ex;
    T? data;

    try {
      data = await processing();
    } on DioException catch (e) {
      // await FirebaseCrashlytics.instance.recordError(
      //   e,
      //   e.stackTrace,
      //   reason: 'a non-fatal error',
      //   fatal: true,
      // );
      if (e.type == DioExceptionType.unknown) {
        ex = CustomException(
          title: 'Соединение отсутствует',
          subtitle: '''Как только соединение восстановится, '''
              '''вы снова сможете пользоваться приложением''',
          stackTrace: e.stackTrace,
        );
      } else {
        ex = CustomException(
          title: dioErrorText ?? 'Ошибка при отправке запроса',
          subtitle: e.message,
          stackTrace: e.stackTrace,
        );
      }
    } on ResponseParseException catch (e) {
      // await FirebaseCrashlytics.instance.recordError(
      //   e,
      //   e.stackTrace,
      //   reason: 'a non-fatal error',
      //   information: [
      //     e.data.toString(),
      //   ],
      // );
      ex = CustomException(
        title:
            responseParseErrorText ?? 'Ошибка при обработке ответа от сервера',
        subtitle: e.toString(),
        stackTrace: e.stackTrace,
      );
    } on SuccessFalse catch (e) {
      ex = CustomException(
        title: 'Ошибка',
        subtitle: e.toString(),
        stackTrace: e.stackTrace,
      );
    } on AccessException catch (e) {
      // userEntity.clearUserData();
      // UserSingleton.clearUserData();
      // AuthorizationSingleton.setAuthorization(false);

      ex = CustomException(
        title: e.toString(),
        stackTrace: e.stackTrace,
      );
    } catch (e) {
      // await FirebaseCrashlytics.instance.recordError(
      //   e,
      //   StackTrace.current,
      //   reason: 'a non-fatal error',
      //   fatal: true,
      // );
      ex = CustomException(
        title: otherErrorText ?? 'Непредвиденная ошибка',
        subtitle: e.toString(),
        stackTrace: StackTrace.current,
      );
    }

    return (data, ex);
  }
}
