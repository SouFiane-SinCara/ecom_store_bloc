import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.onPrimary,
      body: Center(
          child: CircularProgressIndicator(color: themeData.primaryColorDark)),
    );
  }
}
