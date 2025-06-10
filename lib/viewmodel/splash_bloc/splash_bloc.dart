import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/viewmodel/splash_bloc/splash_event.dart';
import 'package:project2/viewmodel/splash_bloc/splash_state.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<splashLoading>(_splashLoading);
  }
  Future<void>_splashLoading(splashLoading event,Emitter emit)async{
    emit(state.copyWith(splashStatus: stateus.loading));
    await Future.delayed(Duration(seconds: 5));
    emit(state.copyWith(splashStatus: stateus.success));
  }
}
