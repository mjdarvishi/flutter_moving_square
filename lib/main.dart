import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/routes/app_routes.dart';
import 'package:mc_crud_test/config/themes/app_theme.dart';
import 'package:mc_crud_test/utils/context_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ApplicationContext.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'test app',
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: AppTheme.light,
    );
  }
}
