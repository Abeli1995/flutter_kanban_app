import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/deal_model.dart';
import '../model/stage_model.dart';
import 'kanban_event.dart';
import 'kanban_state.dart';

class KanbanBloc extends Bloc<KanbanEvent, KanbanState> {
  KanbanBloc() : super(KanbanLoading()) {
    on<LoadStages>(_onLoadStages);
    on<MoveCardEvent>(_onMoveCardEvent);
  }

  void _onLoadStages(LoadStages event, Emitter<KanbanState> emit) {
    try {
      final stages = _fetchStages();
      emit(KanbanLoaded(stages));
    } catch (_) {
      emit(KanbanError());
    }
  }

  //добавлено передвижение карточки
  void _onMoveCardEvent(MoveCardEvent event, Emitter<KanbanState> emit) {
    if (state is KanbanLoaded) {
      final currentState = state as KanbanLoaded;
      final fromStage = currentState.stages
          .firstWhere((stage) => stage.id == event.fromStageId);
      final toStage = currentState.stages
          .firstWhere((stage) => stage.id == event.toStageId);
      final deal =
          fromStage.deals.firstWhere((deal) => deal.id == event.cardId);

      final updatedDeal = Deal(
        id: deal.id,
        title: deal.title,
        date: deal.date,
        manager: deal.manager,
        stageId: event.toStageId,
      );

      fromStage.deals.remove(deal);
      toStage.deals.add(updatedDeal);

      emit(KanbanLoaded(List.from(currentState.stages)));
    }
  }

  List<Stage> _fetchStages() {
    final jsonData = {
      "stages": [
        {
          "id": 1,
          "title": "Стадия 1",
          "deals": [
            {
              "id": 1,
              "title": "Сделка 1",
              "date": "15 мая",
              "manager": "Иванов И.И."
            },
            {
              "id": 2,
              "title": "Сделка 2",
              "date": "23 апреля",
              "manager": "Петров П.П."
            },
            {
              "id": 3,
              "title": "Сделка 3",
              "date": "01 июня",
              "manager": "Сидоров С.С."
            }
          ]
        },
        {
          "id": 2,
          "title": "Стадия 2",
          "deals": [
            {
              "id": 4,
              "title": "Сделка 4",
              "date": "05 июля",
              "manager": "Кузнецов К.К."
            }
          ]
        }
      ]
    };
    var stagesList = jsonData['stages'] as List;
    return stagesList.map((i) => Stage.fromJson(i)).toList();
  }
}
