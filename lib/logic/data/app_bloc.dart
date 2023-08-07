import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_store_bloc/data/api/getprodect.dart';
import 'package:ecom_store_bloc/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  int counter = 0;
  late List<ProdectModel> data;
  AppBloc() : super(AppInitial()) {
    on<Dataevent>(dataevents);
  }

  Future<FutureOr<void>> dataevents(
      Dataevent event, Emitter<AppState> emit) async {
    emit(getDataState());
    try {
      data = await GetProducts().getproducts();
      emit(loadedDataState(prodectModel: data));
    } catch (e) {
      emit(ErrorState(Error: e.toString()));
    }
  }

  
}
