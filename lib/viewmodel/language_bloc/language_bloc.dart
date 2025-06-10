
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:project2/core/utils/status.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState()) {
    on<loadLanguage>(_loadLanguage);
    on<changeLanguage>(_changeLanguage);
  }
  Future<void>_loadLanguage(loadLanguage event,Emitter emit)async{
    try{
      emit(state.copyWith(languageStatus: stateus.loading));

      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('languageCode') ?? 'en';

      emit(state.copyWith(languageStatus: stateus.success,locale: Locale(languageCode)));
    }catch(e){
      emit(state.copyWith(languageStatus: stateus.failure,errorMessage: e.toString()));
    }

  }
  Future<void>_changeLanguage(changeLanguage event,Emitter emit)async{
   try{
     emit(state.copyWith(languageStatus: stateus.loading));

     final prefs = await SharedPreferences.getInstance();
     await prefs.setString('languageCode', event.code);

     emit(state.copyWith(languageStatus: stateus.success,locale: Locale(event.code)));
   }catch(e){
     emit(state.copyWith(languageStatus: stateus.failure,errorMessage: e.toString()));
   }
  }
}
