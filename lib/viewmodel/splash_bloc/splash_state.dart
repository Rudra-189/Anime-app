
import 'package:equatable/equatable.dart';
import 'package:project2/core/utils/status.dart';

class SplashState extends Equatable{
  final status splashStatus;
  final String errorMessage;

  SplashState({this.splashStatus = status.init, this.errorMessage = ''});

  SplashState copyWith({status? splashStatus,String? errorMessage}){
    return SplashState(
      splashStatus: splashStatus ?? this.splashStatus,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object> get props => [splashStatus,errorMessage];
}
