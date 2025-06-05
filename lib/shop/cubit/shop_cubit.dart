import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'models/shop_product_model.dart';
import 'shop_repository.dart';
import 'models/shop_delivery_model.dart';
import 'models/shop_promotion_model.dart';
import 'models/shop_model.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this.shopRepository) : super(ShopLoading());

  final ShopRepository shopRepository;

  Future<List<ShopProductModel>?> fetchData() async {
    dynamic abc;
    try {
      emit(ShopLoading());
      // shopRepository.fetchItem().then((items) {
      //   if (items != null) {
      //     print('fake1');
      //     abc = items;
      //   } else {
      //     emit(ShopError(message: "Error while fetching Items"));
      //   }
      // });
      //
      shopRepository.fetchAll().then((value) {
        emit(ShopLoaded(
            shopItems: value[0],
            shop: value[1],
            shopPromotion: value[3],
            shopDelivery: value[2]));
      });
    } catch (e) {
      print("Try Catch000");
      print(e);
      emit(ShopError(message: e.toString()));
    }
  }
}
