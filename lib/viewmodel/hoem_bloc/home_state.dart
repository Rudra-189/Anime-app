import 'package:equatable/equatable.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/model/animeDataModel.dart';

class HomeState extends Equatable {
  final List<Anime> data;
  final status homeStatus;
  final String errorMessage;

  HomeState({this.data = const [], this.homeStatus = status.init,this.errorMessage = ''});

  HomeState copyWith({List<Anime>? data, status? homeStatus,String? errorMessage}) {
    return HomeState(
        data: data ?? this.data, homeStatus: homeStatus ?? this.homeStatus,errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [data,homeStatus,errorMessage];
}
