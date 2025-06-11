import 'package:equatable/equatable.dart';

import '../../core/utils/status.dart';
import '../../model/animeDataModel.dart';

class SearchState extends Equatable{
  final List<Anime> data;
  final status searchStatus;
  final String errorMessage;

  SearchState({this.data = const [], this.searchStatus = status.init,this.errorMessage = ''});

  SearchState copyWith({List<Anime>? data, status? searchStatus,String? errorMessage}) {
    return SearchState(
        data: data ?? this.data, searchStatus: searchStatus ?? this.searchStatus,errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [data,searchStatus,errorMessage];
}

