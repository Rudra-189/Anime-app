import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../core/utils/status.dart';
import '../../model/animeDataModel.dart';

class SearchState extends Equatable{
  final List<Anime> data;
  final status searchStatus;
  final String errorMessage;
  final TextEditingController? searchController;

  SearchState({this.data = const [], this.searchStatus = status.init,this.errorMessage = '',this.searchController});

  SearchState copyWith({List<Anime>? data, status? searchStatus,String? errorMessage,TextEditingController? searchController}) {
    return SearchState(
        data: data ?? this.data, searchStatus: searchStatus ?? this.searchStatus,errorMessage: errorMessage ?? this.errorMessage,searchController: TextEditingController());
  }

  @override
  List<Object?> get props => [data,searchStatus,errorMessage,searchController];
}

