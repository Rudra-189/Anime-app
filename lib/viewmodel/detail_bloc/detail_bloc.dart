import 'package:bloc/bloc.dart';
import 'package:project2/core/utils/status.dart';

import '../../core/api_config/client/api_client.dart';
import '../../model/animeDataModel.dart';
import '../../repository/home_repository.dart';
import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {

  final HomeRepository repository = HomeRepository(apiClient: ApiClient());

  DetailBloc() : super(DetailState()) {
    on<LoadAnimeDetailEvent>(_loadAnimeDetailEvent);
  }
  Future<void>_loadAnimeDetailEvent(LoadAnimeDetailEvent event,Emitter emit)async{
    emit(state.copyWith(detailPageStatus: status.loading));
    try{
      final Anime data = await repository.getAnimeDataById(event.id);
      if(data != null){
        emit(state.copyWith(detailPageStatus: status.success,data: data));
      }else{
        emit(state.copyWith(detailPageStatus: status.failure,errorMessage: 'data not found'));
      }

    }catch(e){
      emit(state.copyWith(detailPageStatus: status.failure,errorMessage: e.toString()));
    }
  }
}
