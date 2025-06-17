
import 'package:bloc/bloc.dart';
import 'package:project2/viewmodel/webView_bloc/wab_view_event.dart';
import 'package:project2/viewmodel/webView_bloc/wab_view_state.dart';

import '../../core/utils/status.dart';

class WebViewBloc extends Bloc<WebViewEvent, WebViewState> {
  WebViewBloc() : super(WebViewState()) {
    on<LoadWebViewEvent>(_loadWebViewEvent);
  }
  Future<void>_loadWebViewEvent(LoadWebViewEvent event,Emitter emit)async{
    emit(state.copyWith(wabViewStatus: status.loading));
    final isValid = Uri.tryParse(event.url)?.isAbsolute ?? false;
    if (isValid) {
      emit(state.copyWith(wabViewStatus: status.success));
    } else {
      emit(state.copyWith(wabViewStatus: status.failure,errorMessage: 'not valid'));
    }
  }
}
