// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecom_store_bloc/constants/colors.dart';
import 'package:ecom_store_bloc/constants/strings.dart';
import 'package:ecom_store_bloc/logic/cart/cubit/cart_counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:ecom_store_bloc/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsP extends StatelessWidget {
  ProdectModel product;
  Mycolors colors = Mycolors();
  DetailsP({
    required this.product,
  });
  fun(int i) {
    for (int j = 0; j < i + 1;) {
      j++;
      return Icon(Icons.star);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: theme.primaryColorDark,
                          size: 30,
                        )),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.005),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, cartpage);
                          },
                          icon: Container(
                            height: size.height * 0.05,
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
                                                fontSize: 15,
                                                color: theme.primaryColorDark),
                                          );
                                        } else {
                                          return Text(
                                            "${0}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 15,
                                                color: theme.primaryColorDark),
                                          );
                                        }
                                      },
                                    )),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: theme.primaryColorDark,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                    vertical: size.height * 0.01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: theme.shadowColor,
                          offset: Offset(3, 3))
                    ],
                    color: colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Image.network(
                    "${product.image}",
                    height: size.height * 0.4,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    " (${product.rating['rate']})",
                    maxLines: 4,
                    style: TextStyle(
                        fontSize: 15,
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      if (index < product.rating['rate'] &&
                          index + 1 > product.rating['rate']) {
                        return Icon(
                          Icons.star_half_outlined,
                          color: Colors.yellow[700],
                          size: 20,
                        );
                      } else if (index - 1 < product.rating['rate'] - 1) {
                        return Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 20,
                        );
                      } else {
                        return Icon(
                          Icons.star_border,
                          color: Colors.yellow[700],
                          size: 20,
                        );
                      }
                    }),
                  ),
                  AutoSizeText(
                    " (${product.rating['count']})",
                    maxLines: 4,
                    style: TextStyle(
                        fontSize: 15,
                        color: theme.primaryColorDark,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 0.1,
                    child: IconButton(
                        onPressed: () {},
                        icon: Container(
                          width: size.width * 0.3,
                          height: size.height * 1,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 15,
                                  offset: Offset(3, 3),
                                  color: theme.shadowColor),
                            ],
                            border: Border.all(
                                width: 2, color: theme.primaryColorDark),
                            color: theme.primaryColorLight,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            "Buy now",
                            maxLines: 4,
                            style: TextStyle(
                                fontSize: 20,
                                color: theme.primaryColorDark,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  ),
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 0.1,
                    child: IconButton(
                        onPressed: () {
                          BlocProvider.of<CartCounterCubit>(context)
                              .addToCart(product);
                        },
                        icon: Container(
                            width: size.width * 0.3,
                            height: size.height * 1,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 15,
                                    offset: Offset(3, 3),
                                    color: theme.shadowColor),
                              ],
                              border: Border.all(
                                  width: 2, color: theme.primaryColorDark),
                              color: theme.primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  "Add to ",
                                  maxLines: 4,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: theme.primaryColorDark,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: theme.primaryColorDark,
                                ),
                              ],
                            ))),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.004),
                padding: EdgeInsets.only(
                    left: size.width * 0.03,
                    top: size.height * 0.02,
                    right: size.width * 0.02),
                width: size.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: theme.shadowColor,
                          offset: Offset(3, -5),
                          blurRadius: 15)
                    ],
                    border: Border.all(width: 3, color: theme.primaryColorDark),
                    color: theme.primaryColorLight,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: size.width * 0.25,
                          height: size.height * 0.065,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.secondary,
                              border: Border.all(
                                  width: 2, color: theme.primaryColorDark),
                              boxShadow: [
                                BoxShadow(
                                    color: theme.shadowColor,
                                    offset: Offset(3, 3),
                                    blurRadius: 15)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: AutoSizeText(
                            "${product.price} \$",
                            maxLines: 4,
                            style: TextStyle(
                                fontSize: 20,
                                color: theme.primaryColorDark,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    AutoSizeText(
                      "${product.title}",
                      maxLines: 4,
                      style: TextStyle(
                          fontSize: 20,
                          color: theme.primaryColorDark,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      color: theme.primaryColorDark,
                      height: 50,
                      endIndent: size.width * 0.08,
                      indent: size.width * 0.08,
                    ),
                    AutoSizeText(
                      "${product.description}",
                      style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
