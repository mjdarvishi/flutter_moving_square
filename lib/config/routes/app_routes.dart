import 'package:flutter/material.dart';
import 'package:mc_crud_test/pages/square.dart';

// i usually use go_router for routing but because this is small application
// i use simple routing
class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute( MyApp());
      default:
        return _materialRoute( MyApp());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
