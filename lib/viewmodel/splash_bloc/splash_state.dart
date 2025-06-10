
import 'package:equatable/equatable.dart';
import 'package:project2/core/utils/status.dart';

class SplashState extends Equatable{
  final stateus splashStatus;
  final String errorMessage;

  SplashState({this.splashStatus = stateus.init, this.errorMessage = ''});

  SplashState copyWith({stateus? splashStatus,String? errorMessage}){
    return SplashState(
      splashStatus: splashStatus ?? this.splashStatus,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object> get props => [splashStatus,errorMessage];
}
