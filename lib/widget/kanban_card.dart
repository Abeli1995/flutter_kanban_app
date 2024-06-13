import 'package:flutter/material.dart';
import '../model/deal_model.dart';

class KanbanCard extends StatelessWidget {
  final Deal deal;

  const KanbanCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(deal.title),
        subtitle: Text('${deal.date} \nМенеджер: ${deal.manager}'),
      ),
    );
  }
}
