import 'package:equatable/equatable.dart';
import '../../core/utils/status.dart';
import '../../model/animeDataModel.dart';

class SearchState extends Equatable {
  final List<Anime> data;
  final List<Anime> filterData;
  final status searchStatus;
  final String errorMessage;

  const SearchState(
      {this.data = const [],
      this.filterData = const [],
      this.searchStatus = status.init,
      this.errorMessage = '',});


  SearchState copyWith(
      {List<Anime>? data,
      List<Anime>? filterData,
      status? searchStatus,
      String? errorMessage}) {
    return SearchState(
        data: data ?? this.data,
        filterData: filterData ?? this.filterData,
        searchStatus: searchStatus ?? this.searchStatus,
        errorMessage: errorMessage ?? this.errorMessage
        );
  }

  @override
  List<Object?> get props =>
      [data, filterData, searchStatus, errorMessage];
}
