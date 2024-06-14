// Events
import 'package:equatable/equatable.dart';

abstract class KanbanEvent extends Equatable {
  const KanbanEvent();

  @override
  List<Object> get props => [];
}

class LoadStages extends KanbanEvent {}