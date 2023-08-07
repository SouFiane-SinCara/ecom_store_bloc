import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecom_store_bloc/constants/strings.dart';
import 'package:ecom_store_bloc/data/model/product_model.dart';
import 'package:ecom_store_bloc/logic/cart/cubit/cart_counter_cubit.dart';
import 'package:ecom_store_bloc/logic/data/app_bloc.dart';
import 'package:ecom_store_bloc/presentaion/themes/dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mycard extends StatelessWidget {
  ProdectModel prodect;
  bool listview;
  Mycard({required this.prodect, required this.listview});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, detailpage, arguments: prodect);
      },
      child: Container(
        decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            boxShadow: [
              BoxShadow(
                  color: theme.shadowColor,
                  blurRadius: 15,
                  offset: Offset(2, 4))
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            )),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: height * 0.45,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Image.network(
                      '${prodect.image}',
                    )),
              ),
            ),
            Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: width * 0.39,
                        child: AutoSizeText(
                          "${prodect.title}",
                          maxLines: 3,
                          style: TextStyle(
                              color: theme.primaryColorDark,
                              fontWeight: FontWeight.w800,
                              fontSize: 10),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: Text(
                          "${prodect.price} \$",
                          style: TextStyle(
                              color: theme.primaryColorDark,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 10,
                        child: IconButton(
                            onPressed: () {
                              BlocProvider.of<CartCounterCubit>(context)
                                  .addToCart(prodect);
                              
                            },
                            icon: listview
                                ? SizedBox(
                                    width: 0,
                                    height: 0,
                                  )
                                : Icon(
                                    Icons.shopping_cart,
                                    color: theme.primaryColorDark,
                                  )))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
