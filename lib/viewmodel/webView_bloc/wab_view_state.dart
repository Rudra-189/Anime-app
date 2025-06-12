import 'package:equatable/equatable.dart';
import 'package:project2/core/utils/status.dart';

class WebViewState extends Equatable{
  final status webViewStatus;
  final String errorMessage;

  WebViewState({this.webViewStatus = status.init,this.errorMessage = ''});

  WebViewState copyWith({status? wabViewStatus,String? errorMessage}){
    return WebViewState(
      webViewStatus: wabViewStatus ?? this.webViewStatus,
      errorMessage: errorMessage ?? this.errorMessage
    );
}

  @override
  List<Object> get props => [webViewStatus,errorMessage];
}

