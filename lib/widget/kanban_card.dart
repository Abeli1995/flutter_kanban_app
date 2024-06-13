import 'package:flutter/material.dart';
import '../model/deal_model.dart';

class KanbanCard extends StatelessWidget {
  final Deal deal;
  // final int stageId;

  const KanbanCard({
    super.key,
    required this.deal,
    // required this.stageId,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<Deal>(
      data: deal,
      feedback: Material(
        child: Card(
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
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                        ),
                        minimumSize: MaterialStateProperty.all(Size.zero),
                        backgroundColor: MaterialStateProperty.all(
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
        ),
      ),
      childWhenDragging: Container(),
      child: Card(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
