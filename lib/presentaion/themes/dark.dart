import 'package:ecom_store_bloc/constants/colors.dart';
import 'package:flutter/material.dart';

Mycolors colors = Mycolors();
ThemeData dark = ThemeData(
    primaryColorLight: Colors.black,
    colorScheme: ColorScheme.light(
        onPrimary: colors.darkGrey,
        secondary: Colors.black26,
        primary: Colors.white70),
    shadowColor: Colors.black,
    primaryColorDark: colors.lightGrey,
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: colors.darkGrey));
