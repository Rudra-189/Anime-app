import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class loadAnimeDetail extends DetailEvent{
  final int id;

  loadAnimeDetail(this.id);

  @override
  List<Object> get props => [id];
}
