import 'package:flutter/material.dart';

class ApplicationContext {
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
}
BuildContext? get getContext{
  return ApplicationContext.navigatorKey.currentContext;
}