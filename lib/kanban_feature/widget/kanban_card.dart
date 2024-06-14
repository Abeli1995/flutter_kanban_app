import 'package:flutter/material.dart';
import '../model/deal_model.dart';

class KanbanCard extends StatelessWidget {
  final Deal deal;

  const KanbanCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 12),
      child: ListTile(
        title: Text(
          deal.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text('${deal.date} \nМенеджер: ${deal.manager}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Дела'),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    ),
                    minimumSize: WidgetStateProperty.all(Size.zero),
                    backgroundColor: WidgetStateProperty.all(
                      Colors.lightBlueAccent,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Запланировать',
                    style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
