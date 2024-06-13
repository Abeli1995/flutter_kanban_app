import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/kanban_bloc.dart';
import '../bloc/kanban_event.dart';
import '../bloc/kanban_state.dart';
import '../model/deal_model.dart';
import '../model/stage_model.dart';

class KanbanBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kanban Board'),
      ),
      body: BlocProvider(
        create: (context) => KanbanBloc()..add(LoadStages()),
        child: KanbanView(),
      ),
    );
  }
}

class KanbanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KanbanBloc, KanbanState>(
      builder: (context, state) {
        if (state is KanbanLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is KanbanLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.stages
                  .map((stage) => KanbanColumn(stage: stage))
                  .toList(),
            ),
          );
        } else {
          return Center(child: Text('Ошибка загрузки данных'));
        }
      },
    );
  }
}

class KanbanColumn extends StatelessWidget {
  final Stage stage;

  KanbanColumn({required this.stage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  stage.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${stage.dealsCount} карточек',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          ...stage.deals.map((deal) => KanbanCard(deal: deal)).toList(),
        ],
      ),
    );
  }
}

class KanbanCard extends StatelessWidget {
  final Deal deal;

  KanbanCard({required this.deal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(deal.title),
        subtitle: Text('${deal.date} \nМенеджер: ${deal.manager}'),
      ),
    );
  }
}
