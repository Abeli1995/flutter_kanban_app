class Deal {
  final int id;
  final String title;
  final String date;
  final String manager;
  final int? stageId;

  Deal({
    required this.id,
    required this.title,
    required this.date,
    required this.manager,
     this.stageId
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      manager: json['manager'],
    );
  }
}

