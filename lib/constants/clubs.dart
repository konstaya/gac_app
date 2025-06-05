const clubs = [
  {'id': '1', 'name':'на Каслинской'},
  {'id': '2', 'name':'на Чайковского'},
];

String? getClubNameById(String id) {
  final club = clubs.firstWhere((item) => item['id'] == id);
  return club['name'];
}

String? getClubIdByName(String name) {
  final club = clubs.firstWhere((item) => item['name'] == name);
  return club['id'];
}

List<String> clubNames = clubs.map((club) => club['name']).whereType<String>().toList();