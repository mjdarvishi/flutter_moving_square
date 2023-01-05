import 'package:flutter/material.dart';
import 'package:mc_crud_test/presentation/add_customer/view/add_customer.page.dart';
import 'package:mc_crud_test/presentation/home/view/home.page.dart';

// i usually use go_router for routing but because this is small application
// i use simple routing
class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute( HomePage());
      case '/add':
        return _materialRoute(AddCustomerPage(settings.arguments as VoidCallback));
      default:
        return _materialRoute( HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
