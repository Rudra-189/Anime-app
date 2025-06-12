import 'package:equatable/equatable.dart';

abstract class WabViewEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class LoadWabView extends WabViewEvent{
  final String url;

  LoadWabView(this.url);

  @override
  List<Object>get props => [url];
}
