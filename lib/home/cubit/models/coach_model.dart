
class CoachModel {
  final String education;
  final String specialization;
  final String description;
  final num club;
  final num id;
  final String username;
  final String fullName;
  final String birthDate;
  final String phoneNumber;
  final String email;

  const CoachModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.birthDate,
    required this.phoneNumber,
    required this.email,
    required this.education,
    required this.specialization,
    required this.description,
    required this.club
  });

  factory CoachModel.fromJson(Map<String, dynamic> json){
    return CoachModel(
        id: json['user']['id'],
        username: json['user']['username'],
        fullName: json['user']['full_name'],
        birthDate: json['user']['birth_date'],
        phoneNumber: json['user']['phone_number'],
        email: json['user']['email'],
        education: json['education'],
        specialization: json['specialization'],
        description: json['description'],
        club: json['club'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'education': this.education,
      'specialization': this.specialization,
      'description': this.description,
      'club': this.club,
      'id': this.id,
      'username': this.username,
      'fullName': this.fullName,
      'birthDate': this.birthDate,
      'phoneNumber': this.phoneNumber,
      'email': this.email,
    };
  }

  factory CoachModel.fromMap(Map<String, dynamic> map) {
    return CoachModel(
      education: map['education'] as String,
      specialization: map['specialization'] as String,
      description: map['description'] as String,
      club: map['club'] as num,
      id: map['id'] as num,
      username: map['username'] as String,
      fullName: map['fullName'] as String,
      birthDate: map['birthDate'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
    );
  }
}


