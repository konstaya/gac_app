import 'models/shop_model.dart';
import 'models/shop_product_model.dart';
import 'models/shop_delivery_model.dart';
import 'models/shop_promotion_model.dart';
import 'fetch_data.dart';

class ShopRepository{
  final FetchData fetchData;

  ShopRepository({required this.fetchData});

  Future<List<ShopProductModel>?> fetchItem() async{
    final shop_item = await fetchData.fetchProducts();
    return shop_item.map((e) => ShopProductModel.fromJson(e)).toList();
  }
  Future<List<ShopModel>?> fetchSh() async{
    final shop = await fetchData.fetchShop();
    return shop.map((e) => ShopModel.fromJson(e)).toList();
  }
  Future<List<ShopDeliveryModel>?> fetchDe() async{
    final shop_pr = await fetchData.fetchDelivery();
    return shop_pr.map((e) => ShopDeliveryModel.fromJson(e)).toList();
  }
  Future<List<ShopPromotionModel>?> fetchPr() async{
    final shop_de = await fetchData.fetchPromotion();
    return shop_de.map((e) => ShopPromotionModel.fromJson(e)).toList();
  }

  // Future<List> fetchAll() async{
  //   return [await fetchItem(), await fetchSh(), await fetchDe(), await fetchPr()];
  // }

  Future<List> fetchAll() async {
    final futures = [
      fetchItem(),
      fetchSh(),
      fetchDe(),
      fetchPr(),
    ];

    return await Future.wait(futures);
  }
}