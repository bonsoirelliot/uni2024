import 'dart:async';

import 'package:api_client/core/di/dependencies.dart';
import 'package:api_client/core/di/initialize_dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

Future<Dependencies>? _$initializeApp;

/// Инициализация приложения
Future<Dependencies> $initializeApp({
  void Function(int progress, String message)? onProgress,
  FutureOr<void> Function(Dependencies dependencies)? onSuccess,
  void Function(Object error, StackTrace stackTrace)? onError,
}) =>
    _$initializeApp ??= Future<Dependencies>(() async {
      late final WidgetsBinding binding;

      /// Это нужно, видимо, чтобы посчитать, сколько происходит инициализация
      final stopwatch = Stopwatch()..start();
      try {
        /// Создается биндинг и откладывается рендеринг первого кадра
        ///
        /// Рендеринг возобновится, когда все зависимости будут инициализированы
        binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

        /// Ловятся ошибки, которые могли возникнуть при инициализации фреймворка
        await _catchExceptions();

        /// Инициализация зависимостей
        final dependencies =
            await $initializeDependencies(onProgress: onProgress)
                .timeout(const Duration(minutes: 5));

        await onSuccess?.call(dependencies);

        return dependencies;
      } on Object catch (e, stack) {
        onError?.call(e, stack);
        rethrow;
      } finally {
        /// Выполнится в любом случае: есть ошибки или нет

        stopwatch.stop();

        /// Закрытие сплэш экрана и возобновление рендеринга
        binding.addPostFrameCallback((_) {
          binding.allowFirstFrame();
        });

        _$initializeApp = null;
      }
    });

@visibleForTesting
Future<void> $resetApp(Dependencies dependencies) async {}

@visibleForTesting
Future<void> $disposeApp(Dependencies dependencies) async {}

Future<void> _catchExceptions() async {
  try {
    PlatformDispatcher.instance.onError = (error, stackTrace) {
      //* log
      return true;
    };

    final sourceFlutterError = FlutterError.onError;
    FlutterError.onError = (final details) {
      //* log
      sourceFlutterError?.call(details);
    };
  } on Object {
    //* log
  }
}
