// Events
import 'package:equatable/equatable.dart';

abstract class KanbanEvent extends Equatable {
  const KanbanEvent();

  @override
  List<Object> get props => [];
}

class LoadStages extends KanbanEvent {}

//событие передвижения карточки
class MoveCardEvent extends KanbanEvent {
  final int cardId;
  final int fromStageId;
  final int toStageId;

  MoveCardEvent({
    required this.cardId,
    required this.fromStageId,
    required this.toStageId,
  });

  @override
  List<Object> get props => [cardId, fromStageId, toStageId];
}
