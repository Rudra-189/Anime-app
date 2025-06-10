import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:project2/core/utils/status.dart';

class LanguageState extends Equatable{
  final Locale? locale;
  final String errorMessage;
  final stateus languageStatus;

  LanguageState({this.locale,this.errorMessage = '',this.languageStatus = stateus.init});

  LanguageState copyWith({Locale? locale,String? errorMessage,stateus? languageStatus}){
    return LanguageState(
      locale: locale ?? this.locale,
      errorMessage: errorMessage ?? this.errorMessage,
      languageStatus: languageStatus ?? this.languageStatus
    );
  }

  @override
  List<Object?> get props => [locale,errorMessage,languageStatus];
}
