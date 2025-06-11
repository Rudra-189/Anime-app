import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project2/core/utils/status.dart';

import '../../core/api_config/client/api_client.dart';
import '../../model/animeDataModel.dart';
import '../../repository/home_repository.dart';
import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {

  final homeRepository repository = homeRepository(apiClient: ApiClient());

  DetailBloc() : super(DetailState()) {
    on<loadAnimeDetail>(_loadAnimeDetail);
  }
  Future<void>_loadAnimeDetail(loadAnimeDetail event,Emitter emit)async{
    emit(state.copyWith(detailPageStatus: status.loading));
    try{
      final Anime data = await repository.getAnimeDataById(event.id);
      print(data);
      emit(state.copyWith(detailPageStatus: status.success,data: data));
    }catch(e){
      print("///////////${e.toString()}////////////");
      emit(state.copyWith(detailPageStatus: status.failure,errorMessage: e.toString()));
    }
  }
}
