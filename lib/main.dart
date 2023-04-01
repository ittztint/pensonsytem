import 'package:flutter/material.dart';
import 'package:pensionsystem/UI/screen/authentication/auth_screen.dart';
import 'package:pensionsystem/UI/screen/authentication/login_screen.dart';
import 'package:provider/provider.dart';

import 'core/repositories/providers.dart';

void main() {
  runApp(MultiProvider(providers: AppProviders.providers, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AuthScreen(),
    );
  }
}
