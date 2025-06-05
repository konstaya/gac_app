import 'package:intl/intl.dart';

class PersonModel {
  final int id;
  final String client;
  final int clientId;
  final String trainingName;
  final bool clientAccept;
  final DateTime startTime;
  final String coachName;
  final String coachPhoto;

  const PersonModel({
    required this.id,
    required this.client,
    required this.clientId,
    required this.trainingName,
    required this.clientAccept,
    required this.startTime,
    required this.coachName,
    required this.coachPhoto,
  });


  factory PersonModel.fromJson(Map<String, dynamic> json){
    return PersonModel(
      id: json['id'],
      client: json['client']['user']['full_name'],
      clientId: json['client']['user']['id'],
      trainingName: json['group_type']['name'],
      clientAccept: json['client_accept'],
      startTime: DateTime.parse(json['time_start']),
      coachName: json['coach']['user']['full_name'],
      coachPhoto: json['coach']['description'],
    );
  }

  @override
  String toString() {
    return 'PersonModel{id: $id, client: $client, clientId: $clientId, trainingName: $trainingName, clientAccept: $clientAccept, startTime: $startTime, coachName: $coachName, coachPhoto: $coachPhoto}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'client': this.client,
      'clientId': this.clientId,
      'trainingName': this.trainingName,
      'clientAccept': this.clientAccept,
      'startTime': this.startTime,
      'coachName': this.coachName,
      'coachPhoto': this.coachPhoto,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'] as int,
      client: map['client'] as String,
      clientId: map['clientId'] as int,
      trainingName: map['trainingName'] as String,
      clientAccept: map['clientAccept'] as bool,
      startTime: map['startTime'] as DateTime,
      coachName: map['coachName'] as String,
      coachPhoto: map['coachPhoto'] as String,
    );
  }
}
