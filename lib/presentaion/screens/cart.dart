import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecom_store_bloc/constants/strings.dart';
import 'package:ecom_store_bloc/logic/cart/cubit/cart_counter_cubit.dart';
import 'package:ecom_store_bloc/presentaion/themes/dark.dart';
import 'package:ecom_store_bloc/presentaion/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          BlocProvider.of<CartCounterCubit>(context).cartList.clear();

          BlocProvider.of<CartCounterCubit>(context)
              .emit(CartState(counter: []));
        },
        child: Container(
          decoration: BoxDecoration(
              color: themeData.colorScheme.onPrimary,
              boxShadow: [
                BoxShadow(
                  color: themeData.shadowColor,
                  offset: Offset(-10, -7),
                  blurRadius: 10,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(30))),
          width: width * 0.3,
          margin: EdgeInsets.only(bottom: height * 0.02, right: width * 0.02),
          height: height * 0.07,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "Buy all",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: width * 0.08,
                  color: themeData.primaryColorDark,
                )
              ]),
        ),
      ),
      body: Column(
        children: [
          AppBar(
            backgroundColor: themeData.colorScheme.onPrimary,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: themeData.primaryColorDark,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(top: height * 0.005),
                child: IconButton(
                    onPressed: () {},
                    icon: Container(
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 0,
                              left: 0,
                              child: BlocBuilder<CartCounterCubit,
                                  CartCounterState>(
                                builder: (context, state) {
                                  if (state is CartState) {
                                    return Text(
                                      "${state.counter.length}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                          color: themeData.primaryColorDark),
                                    );
                                  } else {
                                    return Text(
                                      "${0}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 15,
                                          color: themeData.primaryColorDark),
                                    );
                                  }
                                },
                              )),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Icon(
                              Icons.shopping_cart,
                              color: themeData.primaryColorDark,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
            title: AutoSizeText(
              "Y o u r   c a r t",
              style: TextStyle(
                  color: themeData.primaryColorDark,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Expanded(
            child: Container(
              width: width,
              child: BlocBuilder<CartCounterCubit, CartCounterState>(
                builder: (context, state) {
                  if (state is CartState) {
                    return Container(
                      width: width,
                      height: 200,
                      color: themeData.colorScheme.onPrimary,
                      child: ListView.builder(
                        itemCount: state.counter.length,
                        itemBuilder: (context, index) {
                          return index != state.counter.length - 1
                              ? Mycard(
                                  prodect: state.counter[index],
                                  listview: true,
                                )
                              : Container(
                                  margin: EdgeInsets.only(bottom: 90),
                                  child: Mycard(
                                    prodect: state.counter[index],
                                    listview: true,
                                  ),
                                );
                        },
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
