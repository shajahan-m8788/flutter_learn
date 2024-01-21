import 'package:flutter/material.dart';
import 'package:flutter_learn/provider/sign_in_provider.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => SigInProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
      theme: appTheme(),
    );
  }
}
