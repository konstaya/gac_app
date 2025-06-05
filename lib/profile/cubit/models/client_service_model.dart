class ClientServiceModel {
  final int id;
  final int clientId;
  final String name;
  final String description;
  final String sType;
  final String mType;
  final bool paymentStatus;
  final bool isMembership;
  final int visits;
  final int currentVisits;
  final bool isAct;



  const ClientServiceModel({
    required this.id,
    required this.clientId,
    required this.name,
    required this.description,
    required this.paymentStatus,
    required this.isMembership,
    required this.currentVisits,
    required this.visits,
    required this.isAct,
    required this.sType,
    required this.mType,
  });

  factory ClientServiceModel.fromJson(Map<String, dynamic> json){
    return ClientServiceModel(
      id: json['id'],
      clientId: json['client'],
      paymentStatus: json['payment_status'],
      currentVisits: json['current_visits'],
      isAct: json['is_act'],
      name: json['club_service']['service']['name'],
      description: json['club_service']['service']['description'],
      visits: json['club_service']['service']['visits'],
      isMembership: json['club_service']['service']['is_membership'],
      sType: json['club_service']['service']['s_type'] ?? "None",
      mType: json['club_service']['service']['m_type'] ?? "None",

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'clientId': this.clientId,
      'name': this.name,
      'description': this.description,
      'sType': this.sType,
      'mType': this.mType,
      'paymentStatus': this.paymentStatus,
      'isMembership': this.isMembership,
      'visits': this.visits,
      'currentVisits': this.currentVisits,
      'isAct': this.isAct,
    };
  }

  factory ClientServiceModel.fromMap(Map<String, dynamic> map) {
    return ClientServiceModel(
      id: map['id'] as int,
      clientId: map['clientId'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      sType: map['sType'] as String,
      mType: map['mType'] as String,
      paymentStatus: map['paymentStatus'] as bool,
      isMembership: map['isMembership'] as bool,
      visits: map['visits'] as int,
      currentVisits: map['currentVisits'] as int,
      isAct: map['isAct'] as bool,
    );
  }

  @override
  String toString() {
    return 'ClientServiceModel{id: $id, clientId: $clientId, name: $name, description: $description, sType: $sType, mType: $mType, paymentStatus: $paymentStatus, isMembership: $isMembership, visits: $visits, currentVisits: $currentVisits, isAct: $isAct}';
  }
}