import 'package:bloc/bloc.dart';
import 'package:project2/viewmodel/search_bloc/search_event.dart';
import 'package:project2/viewmodel/search_bloc/search_state.dart';

import '../../core/api_config/client/api_client.dart';
import '../../core/utils/status.dart';
import '../../model/animeDataModel.dart';
import '../../repository/home_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final HomeRepository repository = HomeRepository(apiClient: ApiClient());


  SearchBloc() : super(SearchState()) {
    on<LoadSearchDataEvent>(_loadSearchDataEvent);
    on<OnSearchTextChangeEvent>(_onSearchTextChangeEvent);
    on<OnFilterChangeEvent>(_onFilterChangeEvent);
  }
  Future<void>_loadSearchDataEvent(LoadSearchDataEvent event,Emitter emit)async{
    emit(state.copyWith(searchStatus: status.loading));
    try{
      final List<Anime> data = await repository.getAnimeData();
      if(data.isNotEmpty){
        emit(state.copyWith(searchStatus: status.success,data: data,filterData: data));

      }else{
        emit(state.copyWith(searchStatus: status.failure,errorMessage: 'data note found'));

      }
    }catch(e){
      emit(state.copyWith(searchStatus: status.failure,errorMessage: e.toString()));
    }
  }

  void _onSearchTextChangeEvent(OnSearchTextChangeEvent event,Emitter emit){
    final query = event.query.toLowerCase();
    final filtered = query.isEmpty ? state.data :state.filterData.where((e)=>e.title.toLowerCase().contains(query)).toList();
    emit(state.copyWith(data: filtered));
  }

  void _onFilterChangeEvent(OnFilterChangeEvent event,Emitter emit){
    final type = event.type;
    final source = event.source;
    final filtered = source.isEmpty ? state.data : type ? state.filterData.where((e)=>e.type! == source).toList() : state.filterData.where((e)=>e.source! == source).toList();
    emit(state.copyWith(data: filtered));
  }
}
