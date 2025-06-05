class Promotion {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String startDate;
  final String endDate;

  Promotion({
      required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.startDate,
      required this.endDate,});

  @override
  String toString() {
    return 'Promotion{id: $id, name: $name, description: $description, imageUrl: $imageUrl, startDate: $startDate, endDate: $endDate}';
  }

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['image_url'],
        startDate: json['start_date'],
        endDate: json['end_date'],
    );

  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'imageUrl': this.imageUrl,
      'startDate': this.startDate,
      'endDate': this.endDate,
    };
  }

  factory Promotion.fromMap(Map<String, dynamic> map) {
    return Promotion(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
    );
  }
}