

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
    emit(state.copyWith(homeStatus: status.loading));
    try{
      final List<Anime> data =await repository.getAnimeData();
      final originalData = data.where((e)=> e.source == "Original").toList();
      final mangaData = data.where((e)=> e.source == "Manga").toList();

      emit(state.copyWith(homeStatus: status.success,data: data,originalData: originalData,mangaData: mangaData));
    }catch(e){
      emit(state.copyWith(homeStatus: status.failure,errorMessage: e.toString()));
    }
  }
}
