import 'package:bloc/bloc.dart';
import 'package:ecom_store_bloc/data/model/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_counter_state.dart';

class CartCounterCubit extends Cubit<CartCounterState> {
  List<ProdectModel> cartList = [];

  CartCounterCubit() : super(CartCounterInitial(counter: []));
  void addToCart(ProdectModel prodect) {
    cartList.add(prodect);

    emit(CartState(counter: cartList));
  }
}
