// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(
      _current != null,
      'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(
      instance != null,
      'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `ANIME`
  String get lbl_app_name {
    return Intl.message('ANIME', name: 'lbl_app_name', desc: '', args: []);
  }

  /// `START WATCHING`
  String get lbl_start_watching {
    return Intl.message(
      'START WATCHING',
      name: 'lbl_start_watching',
      desc: '',
      args: [],
    );
  }

  /// `START WATCHING E1`
  String get lbl_start_watching_e1 {
    return Intl.message(
      'START WATCHING E1',
      name: 'lbl_start_watching_e1',
      desc: '',
      args: [],
    );
  }

  /// `Dub | Sub`
  String get lbl_dub_sub {
    return Intl.message('Dub | Sub', name: 'lbl_dub_sub', desc: '', args: []);
  }

  /// `Original For You`
  String get lbl_original_for_you {
    return Intl.message(
      'Original For You',
      name: 'lbl_original_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Manga For You`
  String get lbl_manga_for_you {
    return Intl.message(
      'Manga For You',
      name: 'lbl_manga_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Youtube Link :`
  String get lbl_youtube_link {
    return Intl.message(
      'Youtube Link :',
      name: 'lbl_youtube_link',
      desc: '',
      args: [],
    );
  }

  /// `SHOW SYNOPSIS/PLOT :`
  String get lbl_show_synopsis_plot {
    return Intl.message(
      'SHOW SYNOPSIS/PLOT :',
      name: 'lbl_show_synopsis_plot',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get lbl_type {
    return Intl.message('Type', name: 'lbl_type', desc: '', args: []);
  }

  /// `Source`
  String get lbl_source {
    return Intl.message('Source', name: 'lbl_source', desc: '', args: []);
  }

  /// `Status`
  String get lbl_status {
    return Intl.message('Status', name: 'lbl_status', desc: '', args: []);
  }

  /// `MY LIST`
  String get lbl_my_list {
    return Intl.message('MY LIST', name: 'lbl_my_list', desc: '', args: []);
  }

  /// `SHARE`
  String get lbl_share {
    return Intl.message('SHARE', name: 'lbl_share', desc: '', args: []);
  }

  /// `RANK`
  String get lbl_rank {
    return Intl.message('RANK', name: 'lbl_rank', desc: '', args: []);
  }

  /// `POPULARITY`
  String get lbl_popularity {
    return Intl.message(
      'POPULARITY',
      name: 'lbl_popularity',
      desc: '',
      args: [],
    );
  }

  /// `MEMBERS`
  String get lbl_members {
    return Intl.message('MEMBERS', name: 'lbl_members', desc: '', args: []);
  }

  /// `FAVORITES`
  String get lbl_favorites {
    return Intl.message('FAVORITES', name: 'lbl_favorites', desc: '', args: []);
  }

  /// `See more`
  String get lbl_see_more {
    return Intl.message('See more', name: 'lbl_see_more', desc: '', args: []);
  }

  /// `Duration`
  String get lbl_duration {
    return Intl.message('Duration', name: 'lbl_duration', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'gu'),
      Locale.fromSubtags(languageCode: 'hi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
