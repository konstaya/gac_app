class GroupModel {
  final int id;
  final int clubId;
  final int coachId;
  final int duration;
  final int left;
  final String trainingName;
  final String coachName;
  final DateTime startTime;
  final String coachPhoto;

  const GroupModel({
    required this.id,
    required this.clubId,
    required this.duration,
    required this.coachId,
    required this.left,
    required this.trainingName,
    required this.startTime,
    required this.coachPhoto,
    required this.coachName,
  });


  factory GroupModel.fromJson(Map<String, dynamic> json){
    return GroupModel(
      id: json['id'],
      clubId: json['coach']['club'],
      duration: json['duration'],
      coachId: json['coach']['user']['id'],
      left: json['max_count'],
      trainingName: json['group_type']['name'],
      startTime: DateTime.parse(json['time_start']),
      coachPhoto: json['coach']['description'],
      coachName: json['coach']['user']['full_name'],
    );
  }

  @override
  String toString() {
    return 'GroupModel{id: $id, clubId: $clubId, coachId: $coachId, duration: $duration, left: $left, trainingName: $trainingName, coachName: $coachName, startTime: $startTime, coachPhoto: $coachPhoto}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'clubId': this.clubId,
      'coachId': this.coachId,
      'duration': this.duration,
      'left': this.left,
      'trainingName': this.trainingName,
      'coachName': this.coachName,
      'startTime': this.startTime,
      'coachPhoto': this.coachPhoto,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: map['id'] as int,
      clubId: map['clubId'] as int,
      coachId: map['coachId'] as int,
      duration: map['duration'] as int,
      left: map['left'] as int,
      trainingName: map['trainingName'] as String,
      coachName: map['coachName'] as String,
      startTime: map['startTime'] as DateTime,
      coachPhoto: map['coachPhoto'] as String,
    );
  }
}