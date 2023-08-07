import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
ThemeData themeData = Theme.of(context);
    return  Scaffold(
      backgroundColor: themeData.colorScheme.onPrimary,
      body: Center(child: Text("404 \n try later !",style: TextStyle(color: themeData.primaryColorDark,fontWeight: FontWeight.w900,fontSize: 30),),),
    );
  }
}