import 'package:ecom_store_bloc/constants/strings.dart';
import 'package:ecom_store_bloc/data/model/product_model.dart';
import 'package:ecom_store_bloc/logic/cart/cubit/cart_counter_cubit.dart';
import 'package:ecom_store_bloc/logic/data/app_bloc.dart';
import 'package:ecom_store_bloc/presentaion/screens/cart.dart';
import 'package:ecom_store_bloc/presentaion/screens/details_product.dart';
import 'package:ecom_store_bloc/presentaion/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Myroutes {
  Route? routesgenerator(RouteSettings routeSettings) {
    if (routeSettings.name == homepage) {
      return MaterialPageRoute(
        builder: (context) => Home(),
      );
    } else if (routeSettings.name == cartpage) {
      return MaterialPageRoute(
        builder: (context) => CartPage(),
      );
    } else if (routeSettings.name == detailpage) {
      return MaterialPageRoute(
        builder: (context) => DetailsP(product: routeSettings.arguments as ProdectModel),
      );
    }
  }
}
