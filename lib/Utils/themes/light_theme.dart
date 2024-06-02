import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'MrEavesXLModOT',
  primaryColor: Colors.red[900],
  // primarySwatch:  Color(0xff3C8DBC),
  // backgroundColor: const Color(0xffff2f2b),
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  focusColor: Colors.grey,
  scaffoldBackgroundColor: const Color(0xFFEAEBED),
  hintColor: Colors.red[700],
  //accentColor: const Color(0xff3C8DBC),
  cardColor: const Color(0xFFf5f5f5),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);