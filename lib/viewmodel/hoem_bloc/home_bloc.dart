

import 'package:bloc/bloc.dart';
import 'package:project2/core/api_config/client/api_client.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/model/animeDataModel.dart';
import 'package:project2/repository/home_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final homeRepository repository = homeRepository(apiClient: ApiClient());

  HomeBloc() : super(HomeState()) {
    on<loadHomePageData>(_loadHomePageData);
  }
  Future<void>_loadHomePageData(loadHomePageData event,Emitter emit)async{
    print("////////////////////////////");
    emit(state.copyWith(homeStatus: stateus.loading));
    try{
      final List<Anime> data =await repository.getAnimeData();
      emit(state.copyWith(homeStatus: stateus.success,data: data));
    }catch(e){
      emit(state.copyWith(homeStatus: stateus.failure,errorMessage: e.toString()));
    }
  }
}
