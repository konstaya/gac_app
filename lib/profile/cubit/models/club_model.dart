/// id : 1
/// name : "на Каслинской, 23"
/// description : "«КОСМОС» на Каслинской, 23"
/// location : "г. Челябинск, ул. Каслинская, 23"
/// phone : "83512420555"
/// opening_hours : "08:00 - 22:00"
/// price : "https://kosmos74.ru/"
/// number_of_people : 11
/// whatsapp_url : "https://kosmos74.ru/"
/// vk_url : "https://kosmos74.ru/"
/// loc_url : "https://kosmos74.ru/"

class ClubModel {
  final num id;
  final String name;
  final String description;
  final String location;
  final String phone;
  final String openingHours;
  final String price;
  final num numberOfPeople;
  final String whatsappUrl;
  final String vkUrl;
  final String locUrl;
  ClubModel({
      required this.id,
      required this.name,
      required this.description,
      required this.location,
      required this.phone,
      required this.openingHours,
      required this.price,
      required this.numberOfPeople,
      required this.whatsappUrl,
      required this.vkUrl,
      required this.locUrl,});

  factory ClubModel.fromJson(Map<String, dynamic> json){
    return ClubModel(

        id: json['id'],
        name: json['name'],
        description: json['description'],
        location: json['location'],
        phone: json['phone'],
        openingHours: json['opening_hours'],
        price: json['price'],
        numberOfPeople: json['number_of_people'],
        whatsappUrl: json['whatsapp_url'],
        vkUrl: json['vk_url'],
        locUrl: json['loc_url'],
    );

  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'location': this.location,
      'phone': this.phone,
      'openingHours': this.openingHours,
      'price': this.price,
      'numberOfPeople': this.numberOfPeople,
      'whatsappUrl': this.whatsappUrl,
      'vkUrl': this.vkUrl,
      'locUrl': this.locUrl,
    };
  }

  factory ClubModel.fromMap(Map<String, dynamic> map) {
    return ClubModel(
      id: map['id'] as num,
      name: map['name'] as String,
      description: map['description'] as String,
      location: map['location'] as String,
      phone: map['phone'] as String,
      openingHours: map['openingHours'] as String,
      price: map['price'] as String,
      numberOfPeople: map['numberOfPeople'] as num,
      whatsappUrl: map['whatsappUrl'] as String,
      vkUrl: map['vkUrl'] as String,
      locUrl: map['locUrl'] as String,
    );
  }
}