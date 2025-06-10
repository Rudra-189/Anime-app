import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class loadLanguage extends LanguageEvent{}

class changeLanguage extends LanguageEvent{
  final String code;

  changeLanguage({required this.code});

  @override
  List<Object> get props => [code];
}
