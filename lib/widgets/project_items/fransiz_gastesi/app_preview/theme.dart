import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ColorScheme _projectLightColorScheme = const ColorScheme.light().copyWith(
  brightness: Brightness.light,
  primary: const Color.fromARGB(255, 167, 18, 11),
  onPrimary: const Color.fromARGB(255, 254, 237, 236),
  secondary: const Color.fromARGB(255, 0, 85, 164),
  onSecondary: const Color.fromARGB(255, 235, 245, 255),
  tertiary: const Color.fromARGB(255, 173, 216, 255),
  background: const Color.fromARGB(255, 241, 247, 253),
);

ThemeData fransizGastesiTheme = ThemeData.from(colorScheme: _projectLightColorScheme).copyWith(
  canvasColor: _projectLightColorScheme.primary.withOpacity(0.9),
  textTheme:
      GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.black87, displayColor: Colors.black54),
  scaffoldBackgroundColor:
      _projectLightColorScheme.background, //https://github.com/flutter/flutter/issues/101389
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: _projectLightColorScheme.primary, size: 28),
    elevation: 0,
    titleSpacing: 70,
    centerTitle: true,
  ),
  buttonTheme: ThemeData.light().buttonTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
  colorScheme: _projectLightColorScheme,
);
