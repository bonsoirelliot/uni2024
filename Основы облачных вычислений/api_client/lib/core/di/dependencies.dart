import 'package:api_client/core/common/domain/services/executor.dart';
import 'package:api_client/core/common/domain/services/request_handler.dart';
import 'package:api_client/core/common/domain/services/request_helper.dart';
import 'package:api_client/core/di/inherited_dependencies.dart';
import 'package:flutter/material.dart';

/// Dependencies
abstract interface class Dependencies {
  /// Ближайший по дереву объект [Dependencies]
  factory Dependencies.of(BuildContext context) {
    return InheritedDependencies.of(context);
  }

  /// Тут определяем зависимости
  // abstract final SomeDependecy someDependecy;

  /// Отправка запросов.
  abstract final RequestHandler requestHandler;

  /// Обработка ответов от сервера
  abstract final RequestHelper requestHelper;

  abstract final Executor executor;
}

/// Мутабельные зависимости
///
/// Используются в процессе инициализации
final class $MutableDependencies implements Dependencies {
  $MutableDependencies() : context = <String, Object?>{};

  /// Пока не понял, для чего он нужен
  final Map<Object?, Object?> context;

  @override
  late RequestHandler requestHandler;

  @override
  late RequestHelper requestHelper;

  @override
  late Executor executor;

  Dependencies freeze() => _$ImmutableDependencies(
        requestHandler: requestHandler,
        executor: executor,
        requestHelper: requestHelper,
      );
}

/// Иммутабельные
///
/// Ловятся через [InheritedDependencies.of(context)]
final class _$ImmutableDependencies implements Dependencies {
  _$ImmutableDependencies({
    required this.requestHandler,
    required this.executor,
    required this.requestHelper,
  });

  // @override
  // final SomeDependecy someDependecy;

  @override
  final RequestHandler requestHandler;

  @override
  final RequestHelper requestHelper;

  @override
  final Executor executor;
}
