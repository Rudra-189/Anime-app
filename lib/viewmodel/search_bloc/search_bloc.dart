import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project2/viewmodel/search_bloc/search_event.dart';
import 'package:project2/viewmodel/search_bloc/search_state.dart';

import '../../core/api_config/client/api_client.dart';
import '../../core/utils/status.dart';
import '../../model/animeDataModel.dart';
import '../../repository/home_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final homeRepository repository = homeRepository(apiClient: ApiClient());


  SearchBloc() : super(SearchState()) {
    on<LoadSearchData>(_LoadSearchData);
    on<OnSearchTextChange>(_OnSearchTextChange);
  }
  Future<void>_LoadSearchData(LoadSearchData event,Emitter emit)async{
    print("////////////////////////////");
    emit(state.copyWith(searchStatus: status.loading));
    try{
      final List<Anime> data = await repository.getAnimeData();
      emit(state.copyWith(searchStatus: status.success,data: data));
    }catch(e){
      emit(state.copyWith(searchStatus: status.failure,errorMessage: e.toString()));
    }
  }

  void _OnSearchTextChange(OnSearchTextChange event,Emitter emit){
    final query = event.query.toLowerCase();
    final filtered = state.data.where((e)=>e.title.toLowerCase().contains(query)).toList();
    emit(state.copyWith(dataFiltered: filtered));
  }
}
