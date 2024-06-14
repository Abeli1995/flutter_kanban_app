import 'package:flutter/material.dart';
import '../model/stage_model.dart';
import 'kanban_card.dart';

class KanbanColumn extends StatelessWidget {
  final Stage stage;

  const KanbanColumn({super.key, required this.stage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  stage.title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '${stage.dealsCount}',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          // SizedBox(height: 10,),
          ...stage.deals.map((deal) => KanbanCard(deal: deal)),
        ],
      ),
    );
  }
}
