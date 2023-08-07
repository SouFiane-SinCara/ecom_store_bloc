// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_counter_cubit.dart';

@immutable
abstract class CartCounterState {}

class CartCounterInitial extends CartCounterState {
  List<ProdectModel> counter;
  CartCounterInitial({required this.counter});
}

class CartState extends CartCounterState {
  List<ProdectModel> counter;

  CartState({required this.counter});
}

