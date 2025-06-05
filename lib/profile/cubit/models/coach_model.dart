class CoachModel {
  final String fullName;
  final String urlPhoto;
  final String birthDate;
  final String education;
  final String specialization;

  CoachModel({
    required this.fullName,
    required this.urlPhoto,
    required this.birthDate,
    required this.education,
    required this.specialization,
});

  factory CoachModel.fromJson(Map<String, dynamic> json){
    return CoachModel(
      fullName: json['coach']['user']['full_name'],
      birthDate: json['coach']['user']['birth_date'],
      urlPhoto: json['coach']['description'],
      education: json['coach']['education'],
      specialization: json['coach']['specialization'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': this.fullName,
      'urlPhoto': this.urlPhoto,
      'birthDate': this.birthDate,
      'education': this.education,
      'specialization': this.specialization,
    };
  }

  factory CoachModel.fromMap(Map<String, dynamic> map) {
    return CoachModel(
      fullName: map['fullName'] as String,
      urlPhoto: map['urlPhoto'] as String,
      birthDate: map['birthDate'] as String,
      education: map['education'] as String,
      specialization: map['specialization'] as String,
    );
  }

  @override
  String toString() {
    return 'CoachModel{fullName: $fullName, urlPhoto: $urlPhoto, birthDate: $birthDate, education: $education, specialization: $specialization}';
  }
}