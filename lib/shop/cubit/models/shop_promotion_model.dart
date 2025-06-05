/// id : 1
/// name : "Подарочные карты"
/// description : "Подарочные карты"
/// shop : 1

class ShopPromotionModel {
  final int id;
  final String name;
  final String description;
  final int shop;

  const ShopPromotionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.shop,
});

  factory ShopPromotionModel.fromJson(Map<String, dynamic> json) {
    return ShopPromotionModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        shop: json['shop']
    );
  }

  @override
  String toString() {
    return 'ShopPromotionModel{id: $id, name: $name, description: $description, shop: $shop}';
  }
}