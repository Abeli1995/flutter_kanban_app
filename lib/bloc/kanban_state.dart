import 'package:equatable/equatable.dart';

import '../model/deal_model.dart';

abstract class KanbanState extends Equatable {
  const KanbanState();

  @override
  List<Object> get props => [];
}

class KanbanLoading extends KanbanState {}

class KanbanLoaded extends KanbanState {
  final List<Stage> stages;

  const KanbanLoaded(this.stages);

  @override
  List<Object> get props => [stages];
}

class KanbanError extends KanbanState {}