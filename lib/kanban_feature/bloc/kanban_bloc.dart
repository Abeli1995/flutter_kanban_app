import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/stage_model.dart';
import 'kanban_event.dart';
import 'kanban_state.dart';

class KanbanBloc extends Bloc<KanbanEvent, KanbanState> {
  KanbanBloc() : super(KanbanLoading()) {
    on<LoadStages>(_onLoadStages);
  }

  void _onLoadStages(LoadStages event, Emitter<KanbanState> emit) async {
    try {
      final stages = await _fetchStages();
      emit(KanbanLoaded(stages));
    } catch (_) {
      emit(KanbanError());
    }
  }

  Future<List<Stage>> _fetchStages() async {
    final String response = await rootBundle.loadString('assets/stages.json');
    final data = json.decode(response);
    var stagesFromJson = data['stages'] as List;
    List<Stage> stageList =
        stagesFromJson.map((i) => Stage.fromJson(i)).toList();
    return stageList;
  }
}
