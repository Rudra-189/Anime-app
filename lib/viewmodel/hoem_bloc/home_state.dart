import 'package:equatable/equatable.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/model/animeDataModel.dart';

class HomeState extends Equatable {
  final List<Anime> data;
  final stateus homeStatus;
  final String errorMessage;

  HomeState({this.data = const [], this.homeStatus = stateus.init,this.errorMessage = ''});

  HomeState copyWith({List<Anime>? data, stateus? homeStatus,String? errorMessage}) {
    return HomeState(
        data: data ?? this.data, homeStatus: homeStatus ?? this.homeStatus,errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [data,homeStatus,errorMessage];
}
