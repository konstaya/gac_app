
class ServiceModel {

  final int id;
  final String name;
  final String description;
  final int visits;
  final int duration;
  final bool isMembership;
  final String sType;
  final String mType;
  final int price;

  const ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.visits,
    required this.duration,
    required this.isMembership,
    required this.sType,
    required this.mType,
    required this.price,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json){
    return ServiceModel(
      id: json['service']['id'],
      name: json['service']['name'],
      description: json['service']['description'],
      visits: json['service']['visits'],
      duration: json['service']['duration'],
      isMembership: json['service']['is_membership'],
      sType: json['service']['sType'] ?? 'asd',
      mType: json['service']['mType'] ?? 'asd',
      price: json['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'visits': this.visits,
      'duration': this.duration,
      'isMembership': this.isMembership,
      'sType': this.sType,
      'mType': this.mType,
      'price': this.price,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      visits: map['visits'] as int,
      duration: map['duration'] as int,
      isMembership: map['isMembership'] as bool,
      sType: map['sType'] as String,
      mType: map['mType'] as String,
      price: map['price'] as int,
    );
  }

  @override
  String toString() {
    return 'ServiceModel{id: $id, name: $name, description: $description, visits: $visits, duration: $duration, isMembership: $isMembership, sType: $sType, mType: $mType, price: $price}';
  }
}