import 'dart:async';
import 'dart:io';
import 'package:api_client/core/common/domain/services/executor.dart';
import 'package:api_client/core/common/domain/services/request_handler.dart';
import 'package:api_client/core/common/domain/services/request_helper.dart';
import 'package:api_client/core/di/dependencies.dart';
import 'package:flutter/foundation.dart';

/// Инициализирует приложение и возвращает [Dependencies]
Future<Dependencies> $initializeDependencies({
  void Function(int progress, String message)? onProgress,
}) async {
  /// Создаем пустой объект зависимостей
  final dependencies = $MutableDependencies();

  final totalSteps = _initializationSteps.length;

  var currentStep = 0;

  for (final step in _initializationSteps.entries) {
    currentStep++;

    /// Текущий процент выполнения инициализации
    final percent = (currentStep * 100 ~/ totalSteps).clamp(0, 100);
    onProgress?.call(percent, step.key);
    debugPrint('Initialization | $currentStep/$totalSteps ($percent%) | "${step.key}"');

    /// Создаем объект и добавляем его в dependencies
    await step.value(dependencies);
  }

  /// Возвращает инициализированные зависимости
  return dependencies.freeze();
}

/// Метод, который создает объект и добавляет его в dependencies
typedef _InitializationStep = FutureOr<void> Function($MutableDependencies dependencies);

/// <Название шага: метод, создающий зависимость>
final Map<String, _InitializationStep> _initializationSteps = <String, _InitializationStep>{
  'Initialize RequestHandler': (dependencies) {
    dependencies.requestHandler = RequestHandler();
  },
  'Initialize RequestHelper': (dependencies) {
    dependencies.requestHelper = RequestHelper(
      requestHandler: dependencies.requestHandler,
    );
  },
  'Initialize Executor': (dependencies) {
    dependencies.executor = Executor();
  },
};
