class GrRecModel {
  final int id;
  final int groupId;
  final int clientId;

  const GrRecModel({
    required this.id,
    required this.groupId,
    required this.clientId,
  });

  factory GrRecModel.fromJson(Map<String, dynamic> json){
    return GrRecModel(
      id: json['id'],
      groupId: json['group_training'],
      clientId: json['client'],
    );
  }

  @override
  String toString() {
    return 'GrRecModel{id: $id, groupId: $groupId, clientId: $clientId}';
  }
}