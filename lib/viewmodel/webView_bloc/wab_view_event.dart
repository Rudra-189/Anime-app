import 'package:equatable/equatable.dart';

abstract class WebViewEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class LoadWebView extends WebViewEvent{
  final String url;

  LoadWebView(this.url);

  @override
  List<Object>get props => [url];
}
