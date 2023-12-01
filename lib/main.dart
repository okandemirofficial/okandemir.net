import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/const/theme.dart';
import 'package:portfolio_v2/homepage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (p0, p1, p2) {
      return MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'Okan Demir',
        theme: darkTheme,
        initialRoute: '/',
        home: const HomePage(),
      );
    });
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}
