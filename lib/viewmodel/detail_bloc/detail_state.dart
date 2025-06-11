import 'package:equatable/equatable.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/model/animeDataModel.dart';

class DetailState extends Equatable{
  final Anime? data;
  final status detailPageStatus;
  final String errorMessage;

  DetailState({this.data,this.detailPageStatus = status.init,this.errorMessage = ''});

  DetailState copyWith({Anime? data,status? detailPageStatus,String? errorMessage}){
    return DetailState(
      data: data ?? this.data,
      detailPageStatus: detailPageStatus ?? this.detailPageStatus,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props =>[data,detailPageStatus,errorMessage];
}

