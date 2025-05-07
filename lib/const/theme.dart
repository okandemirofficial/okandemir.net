import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const appColorsDark = ColorScheme.dark(
  surface: Color(0XFF181A25),
  onSurface: Color(0XFFCED0DE),
  primary: Color(0XFFE07A5F),
  onPrimary: Color(0XFF552011),
);

final _textTheme = GoogleFonts.interTextTheme(
  ThemeData.dark().textTheme.copyWith(
        headlineLarge: ThemeData.dark().textTheme.headlineLarge!.copyWith(
              fontSize: 64,
              fontWeight: FontWeight.w200,
            ),
        headlineMedium: ThemeData.dark().textTheme.headlineMedium!.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w200,
            ),
        headlineSmall: ThemeData.dark().textTheme.headlineSmall!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w200,
            ),
      ),
).apply(
  displayColor: appColorsDark.onSurface,
  bodyColor: appColorsDark.onSurface,
  decorationColor: appColorsDark.onSurface,
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: appColorsDark,
  textTheme: _textTheme,
);
