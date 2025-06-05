/// "id": 1,
/// "name": "Оптима спорт",
/// "address": "г. Челябинск, ул. Чайковского, 58",
/// "time": "10:00-20:00",
/// "phone": "7(351)242055",
/// "map": "https://yandex.ru/map-widget/v1/-/CBQPBErRHD"

class ShopModel {
  final int id;
  final String name;
  final String address;
  final String time;
  final String phone;
  final String map;

  const ShopModel({
    required this.id,
    required this.name,
    required this.address,
    required this.time,
    required this.phone,
    required this.map
  });

  factory ShopModel.fromJson(Map<String, dynamic> json){
    return ShopModel(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        time: json['time'],
        phone: json['phone'],
        map: json['map']
    );
  }

  @override
  String toString() {
    return 'ShopModel{id: $id, name: $name, address: $address, time: $time, phone: $phone, map: $map}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'address': this.address,
      'time': this.time,
      'phone': this.phone,
      'map': this.map,
    };
  }
}