import 'package:equatable/equatable.dart';

abstract class WebViewEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class LoadWebViewEvent extends WebViewEvent{
  final String url;

  LoadWebViewEvent(this.url);

  @override
  List<Object>get props => [url];
}
