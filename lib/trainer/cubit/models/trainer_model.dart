class TrainerModel {
  int id;
  String name;
  String type;
  String description;
  String guidelines;
  String muscles;
  String youtubeUrl;
  String imageUrl;

  TrainerModel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.guidelines,
    required this.muscles,
    required this.youtubeUrl,
    required this.imageUrl,
  });

  factory TrainerModel.fromJson(Map<String, dynamic> json) {
    return TrainerModel(
      id: json['trainer']['id'],
      name: json['trainer']['name'],
      type: json['trainer']['type'],
      description: json['trainer']['description'],
      guidelines: json['trainer']['guidelines'],
      muscles: json['trainer']['muscles'],
      youtubeUrl: json['trainer']['youtube_url'],
      imageUrl: json['trainer']['image_url'],
    );
  }

  @override
  String toString() {
    return 'TrainerModel{id: $id, name: $name, type: $type, description: $description, guidelines: $guidelines, muscles: $muscles, youtubeUrl: $youtubeUrl, imageUrl: $imageUrl}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'type': this.type,
      'description': this.description,
      'guidelines': this.guidelines,
      'muscles': this.muscles,
      'youtubeUrl': this.youtubeUrl,
      'imageUrl': this.imageUrl,
    };
  }

  factory TrainerModel.fromMap(Map<String, dynamic> map) {
    return TrainerModel(
      id: map['id'] as int,
      name: map['name'] as String,
      type: map['type'] as String,
      description: map['description'] as String,
      guidelines: map['guidelines'] as String,
      muscles: map['muscles'] as String,
      youtubeUrl: map['youtubeUrl'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}