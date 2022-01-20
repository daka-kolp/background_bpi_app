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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Coindesk Test`
  String get appName {
    return Intl.message(
      'Coindesk Test',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Min Value`
  String get minValue {
    return Intl.message(
      'Min Value',
      name: 'minValue',
      desc: '',
      args: [],
    );
  }

  /// `Max Value`
  String get maxValue {
    return Intl.message(
      'Max Value',
      name: 'maxValue',
      desc: '',
      args: [],
    );
  }

  /// `Save the Range`
  String get saveRange {
    return Intl.message(
      'Save the Range',
      name: 'saveRange',
      desc: '',
      args: [],
    );
  }

  /// `The field can not be empty`
  String get cannotBeEmpty {
    return Intl.message(
      'The field can not be empty',
      name: 'cannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `The value is greater than the max`
  String get minValueIsGreaterThenMax {
    return Intl.message(
      'The value is greater than the max',
      name: 'minValueIsGreaterThenMax',
      desc: '',
      args: [],
    );
  }

  /// `The value is less than the max`
  String get maxValueIsLessThenMin {
    return Intl.message(
      'The value is less than the max',
      name: 'maxValueIsLessThenMin',
      desc: '',
      args: [],
    );
  }

  /// `The range is saved`
  String get rangeSaved {
    return Intl.message(
      'The range is saved',
      name: 'rangeSaved',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
