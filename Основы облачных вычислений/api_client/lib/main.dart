import 'dart:async';

import 'package:api_client/core/di/dependencies.dart';
import 'package:api_client/core/di/inherited_dependencies.dart';
import 'package:api_client/core/di/initialization.dart';
import 'package:api_client/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () => $initializeApp(
      onSuccess: (_) {
        runApp(MyApp(
          dependencies: _,
        ));
      },
    ),
    (error, stack) {},
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.dependencies,
    super.key,
  });

  final Dependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return InheritedDependencies(
      dependencies: dependencies,
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}
