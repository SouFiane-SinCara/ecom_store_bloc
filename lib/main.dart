import 'package:ecom_store_bloc/logic/cart/cubit/cart_counter_cubit.dart';
import 'package:ecom_store_bloc/logic/data/app_bloc.dart';
import 'package:ecom_store_bloc/presentaion/routers/routes.dart';
import 'package:ecom_store_bloc/presentaion/themes/dark.dart';
import 'package:ecom_store_bloc/presentaion/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        

            BlocProvider(
              create: (context) => AppBloc()..add(Dataevent()),
            ),
            BlocProvider(
              create: (context) => CartCounterCubit(),
            )
       
      ],
      child: MaterialApp(
        theme: light,
        debugShowCheckedModeBanner: false,
        darkTheme: dark,
        onGenerateRoute: Myroutes().routesgenerator,
      ),
    );
  }
}
