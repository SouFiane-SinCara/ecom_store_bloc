import 'package:ecom_store_bloc/constants/colors.dart';
import 'package:flutter/material.dart';

Mycolors colors = Mycolors();
ThemeData light = ThemeData(
  primaryColorLight: colors.lightGrey,
    colorScheme: ColorScheme.light(
        onPrimary: colors.lightGrey,
        secondary: colors.white,
        primary: Colors.black54),
    shadowColor: Colors.black45,
    primaryColorDark: colors.darkGrey,
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: colors.lightGrey));
