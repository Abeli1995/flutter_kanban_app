import 'deal_model.dart';

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