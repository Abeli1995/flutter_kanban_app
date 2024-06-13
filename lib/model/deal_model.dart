class Deal {
  final int id;
  final String title;
  final String date;
  final String manager;

  Deal({
    required this.id,
    required this.title,
    required this.date,
    required this.manager,
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

class Stage {
  final int id;
  final String title;
  final List<Deal> deals;

  Stage({
    required this.id,
    required this.title,
    required this.deals,
  });

  factory Stage.fromJson(Map<String, dynamic> json) {
    var dealsList = json['deals'] as List;
    List<Deal> deals = dealsList.map((i) => Deal.fromJson(i)).toList();

    return Stage(
      id: json['id'],
      title: json['title'],
      deals: deals,
    );
  }
}