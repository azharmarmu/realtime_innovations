import 'package:flutter/material.dart';

import '__shared/route.dart';
import '__shared/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      onGenerateRoute: generateRoute,
      initialRoute: AppRoutes.dashboard,
    );
  }
}
