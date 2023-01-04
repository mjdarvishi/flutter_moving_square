import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/routes/app_routes.dart';
import 'package:mc_crud_test/config/themes/app_theme.dart';
import 'package:mc_crud_test/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Project',
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: AppTheme.light,
    );
  }
}
