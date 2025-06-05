import '/constants/enum.dart';

class ShopProductModel {
  final int id;
  final String name;
  final String description;
  final ItemCategory itemCategory;
  final int price;
  final int shop;

  const ShopProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.itemCategory,
    required this.price,
    required this.shop,
  });

  factory ShopProductModel.fromJson(Map<String, dynamic> json) {
    final ItemCategory tempCategory;
    switch (json['category']) {
      case 'Спортивные напитки':
        tempCategory = ItemCategory.SportsDrinks;
        break;
      case 'Комплексные протеины':
        tempCategory = ItemCategory.ComplexProteins;
        break;
      case 'Белковые изоляты и гидролизаты':
        tempCategory = ItemCategory.ProteinIsolatesAndHydrolysates;
        break;
      case 'Сывороточные протеины':
        tempCategory = ItemCategory.WheyProteins;
        break;
      case 'Витамины, минералы':
        tempCategory = ItemCategory.VitaminsMinerals;
        break;
      case 'Препараты для суставных связок':
        tempCategory = ItemCategory.DrugsForJointLigaments;
        break;
      case 'Гейнеры (углеводно-белковые смеси)':
        tempCategory = ItemCategory.Gainers;
        break;
      case 'Казеиновые протеины':
        tempCategory = ItemCategory.CaseinProteins;
        break;
      default:
        tempCategory = ItemCategory.Other;
        break;
    }
    return ShopProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        itemCategory: tempCategory,
        price: json['price'],
        shop: json['shop']);
  }

  @override
  String toString() {
    return 'ShopItem{id: $id, name: $name, description: $description,'
        ' itemCategory: $itemCategory, price: $price, shop: $shop}';
  }
}
