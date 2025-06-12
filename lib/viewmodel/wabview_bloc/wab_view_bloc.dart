import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project2/core/utils/status.dart';
import 'package:project2/viewmodel/wabview_bloc/wab_view_event.dart';
import 'package:project2/viewmodel/wabview_bloc/wab_view_state.dart';

class WabViewBloc extends Bloc<WabViewEvent, WabViewState> {
  WabViewBloc() : super(WabViewState()) {
    on<LoadWabView>(_LoadWabView);
  }
  Future<void>_LoadWabView(LoadWabView event,Emitter emit)async{
    emit(state.copyWith(wabViewStatus: status.loading));
    final isValid = Uri.tryParse(event.url)?.isAbsolute ?? false;
    if (isValid) {
      emit(state.copyWith(wabViewStatus: status.success));
    } else {
      emit(state.copyWith(wabViewStatus: status.failure,errorMessage: 'not valid'));
    }
  }
}
