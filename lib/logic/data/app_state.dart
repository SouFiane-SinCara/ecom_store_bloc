// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
abstract class AppState {}


class AppInitial extends AppState {}

class loadedDataState extends AppState {
  List<ProdectModel> prodectModel;
  loadedDataState({required this.prodectModel});
}

class getDataState extends AppState {}

class ErrorState extends AppState {
  String Error;
  ErrorState({required this.Error});
}

