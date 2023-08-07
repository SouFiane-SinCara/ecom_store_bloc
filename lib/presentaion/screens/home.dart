import 'package:ecom_store_bloc/constants/colors.dart';
import 'package:ecom_store_bloc/constants/strings.dart';
import 'package:ecom_store_bloc/data/api/getprodect.dart';
import 'package:ecom_store_bloc/data/model/product_model.dart';
import 'package:ecom_store_bloc/logic/cart/cubit/cart_counter_cubit.dart';
import 'package:ecom_store_bloc/logic/data/app_bloc.dart';
import 'package:ecom_store_bloc/presentaion/screens/error.dart';
import 'package:ecom_store_bloc/presentaion/screens/loading.dart';
import 'package:ecom_store_bloc/presentaion/themes/light.dart';
import 'package:ecom_store_bloc/presentaion/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool onsearch = false;
  List<ProdectModel> searchingProdect = [];
  Mycolors colors = Mycolors();
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is loadedDataState) {
          return Scaffold(
            body: Column(
              children: [
                onsearch
                    ? AppBar(
                        title: Container(
                          width: width,
                          height: height * 0.05,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: width * 0.04),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.secondary,
                              boxShadow: [
                                BoxShadow(
                                    color: theme.shadowColor,
                                    offset: Offset(3, 1),
                                    blurRadius: 15)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: TextField(
                            controller: searchcontroller,
                            onChanged: (value) {
                              setState(() {
                                value = value.replaceAll(RegExp('[ ]'), '');
                                print(value);
                                searchingProdect = state.prodectModel
                                    .where((element) => element.title
                                        .toLowerCase()
                                        .contains(value))
                                    .toList();
                              });
                            },
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                                hintText: "search a prodect",
                                border: InputBorder.none),
                          ),
                        ),
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: theme.primaryColorDark,
                          ),
                          onPressed: () {
                            onsearch = false;
                            setState(() {});
                          },
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              searchcontroller.clear();
                              searchingProdect.clear();
                              setState(() {});
                            },
                            icon: Icon(Icons.close),
                            color: theme.primaryColorDark,
                          )
                        ],
                      )
                    : AppBar(
                        leading: Container(
                          margin: EdgeInsets.only(top: height * 0.005),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, cartpage);
                              },
                              icon: Container(
                                height: height * 0.05,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: BlocBuilder<CartCounterCubit,
                                            CartCounterState>(
                                          builder: (context, state) {
                                            if (state is CartState) {
                                              return Text(
                                                "${state.counter.length}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 20,
                                                    color:
                                                        theme.primaryColorDark),
                                              );
                                            } else {
                                              return Text(
                                                "${0}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 20,
                                                    color:
                                                        theme.primaryColorDark),
                                              );
                                            }
                                          },
                                        )),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: theme.primaryColorDark,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        centerTitle: true,
                        title: Text(
                          'S i  r a',
                          style: TextStyle(
                              color: theme.primaryColorDark,
                              fontWeight: FontWeight.w900,
                              shadows: [
                                BoxShadow(
                                    color: theme.shadowColor,
                                    offset: Offset(3, 1),
                                    blurRadius: 15)
                              ]),
                        ),
                        actions: [
                          IconButton(
                              onPressed: () {
                                onsearch = true;
                                setState(() {});
                              },
                              icon: Container(
                                width: width * 0.065,
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.secondary,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(width * 0.02))),
                                child: Icon(
                                  Icons.search_outlined,
                                  color: theme.primaryColorDark,
                                ),
                              ))
                        ],
                        backgroundColor: theme.appBarTheme.backgroundColor),
                Expanded(
                  child: Container(
                    width: width,
                    height: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: theme.colorScheme.onPrimary,
                    child: searchingProdect.length == 0
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: width / 600,
                                    crossAxisCount: 2),
                            itemCount: state.prodectModel.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    // he where i will do my event
                                  },
                                  child: Mycard(
                                    prodect: state.prodectModel[index],
                                    listview: false,
                                  ));
                            },
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: width / 600,
                                    crossAxisCount: 2),
                            itemCount: searchingProdect.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    // he where i will do my event
                                  },
                                  child: Mycard(
                                    prodect: searchingProdect[index],
                                    listview: false,
                                  ));
                            },
                          ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is getDataState) {
          return Loading();
        } else {
          return SizedBox();
        }
      },
    );
  }
}
