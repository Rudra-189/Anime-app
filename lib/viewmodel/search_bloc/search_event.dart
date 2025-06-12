import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadSearchData extends SearchEvent{}

class OnSearchTextChange extends SearchEvent{
  final String query;

  OnSearchTextChange(this.query);

  @override
  List<Object> get props => [query];
}
