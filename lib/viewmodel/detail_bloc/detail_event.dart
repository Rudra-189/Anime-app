import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadAnimeDetailEvent extends DetailEvent{
  final int id;

  LoadAnimeDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
