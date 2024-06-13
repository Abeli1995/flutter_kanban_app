import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/kanban_bloc.dart';
import '../bloc/kanban_event.dart';
import '../bloc/kanban_state.dart';
import 'kanban_column.dart';

class KanbanBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сделки'),
      ),
      body: BlocProvider(
        create: (context) => KanbanBloc()..add(LoadStages()),
        child: const KanbanView(),
      ),
    );
  }
}

class KanbanView extends StatelessWidget {
  const KanbanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KanbanBloc, KanbanState>(
      builder: (context, state) {
        if (state is KanbanLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
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
          return const Center(
            child: Text('Ошибка загрузки данных'),
          );
        }
      },
    );
  }
}



