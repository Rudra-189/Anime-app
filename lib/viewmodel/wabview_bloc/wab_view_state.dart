import 'package:equatable/equatable.dart';
import 'package:project2/core/utils/status.dart';

class WabViewState extends Equatable{
  final status wabViewStatus;
  final String errorMessage;

  WabViewState({this.wabViewStatus = status.init,this.errorMessage = ''});

  WabViewState copyWith({status? wabViewStatus,String? errorMessage}){
    return WabViewState(
      wabViewStatus: wabViewStatus ?? this.wabViewStatus,
      errorMessage: errorMessage ?? this.errorMessage
    );
}

  @override
  List<Object> get props => [wabViewStatus,errorMessage];
}

