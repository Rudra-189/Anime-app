import 'package:equatable/equatable.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/model/animeDataModel.dart';

class HomeState extends Equatable {
  final List<Anime> data;
  final List<Anime> originalData;
  final List<Anime> mangaData;
  final status homeStatus;
  final String errorMessage;

  const HomeState(
      {this.data = const [],
      this.originalData = const [],
      this.mangaData = const [],
      this.homeStatus = status.init,
      this.errorMessage = ''});

  HomeState copyWith(
      {List<Anime>? data,
      List<Anime>? originalData,
      List<Anime>? mangaData,
      status? homeStatus,
      String? errorMessage}) {
    return HomeState(
        data: data ?? this.data,
        originalData: originalData ?? this.originalData,
        mangaData: mangaData ?? this.mangaData,
        homeStatus: homeStatus ?? this.homeStatus,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props =>
      [data, originalData, mangaData, homeStatus, errorMessage];
}
