import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadSearchDataEvent extends SearchEvent{}

class OnSearchTextChangeEvent extends SearchEvent{
  final String query;

  OnSearchTextChangeEvent(this.query);

  @override
  List<Object> get props => [query];
}

class OnFilterChangeEvent extends SearchEvent{
  final bool type;
  final String source;

  OnFilterChangeEvent({required this.type,required this.source});

  @override
  List<Object> get props => [type,source];
}
