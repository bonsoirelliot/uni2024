import 'package:api_client/features/home/domain/home_screen_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class HomeScreen extends ElementaryWidget<IHomeScreenWM> {
  const HomeScreen({
    super.key,
  }) : super(defaultHomeScreenWMFactory);

  @override
  Widget build(IHomeScreenWM wm) {
    return Scaffold();
  }
}
