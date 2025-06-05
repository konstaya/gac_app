part of 'shop_cubit.dart';

@immutable
abstract class ShopState {
}

class ShopLoading extends ShopState {
}

class ShopLoaded extends ShopState{
  final List<ShopProductModel>? shopItems;
  final List<ShopModel>? shop;
  final List<ShopPromotionModel>? shopPromotion;
  final List<ShopDeliveryModel>? shopDelivery;

  ShopLoaded({this.shopItems, this.shop, this.shopPromotion, this.shopDelivery});

}

class ShopError extends ShopState{
  final message;
  ShopError({this.message});
}