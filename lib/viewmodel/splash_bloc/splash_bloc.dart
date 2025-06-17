import 'package:bloc/bloc.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/viewmodel/splash_bloc/splash_event.dart';
import 'package:project2/viewmodel/splash_bloc/splash_state.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashLoadingEvent>(_splashLoadingEvent);
  }
  Future<void>_splashLoadingEvent(SplashLoadingEvent event,Emitter emit)async{
    emit(state.copyWith(splashStatus: status.loading));
    await Future.delayed(Duration(seconds: 5));
    emit(state.copyWith(splashStatus: status.success));
  }
}
