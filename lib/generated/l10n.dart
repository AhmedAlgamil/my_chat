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

  /// `My Chat`
  String get myChat {
    return Intl.message(
      'My Chat',
      name: 'myChat',
      desc: '',
      args: [],
    );
  }

  /// `Hello There`
  String get HelloThere {
    return Intl.message(
      'Hello There',
      name: 'HelloThere',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Don't Have Account?`
  String get noAccount {
    return Intl.message(
      'Don\'t Have Account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get signUp {
    return Intl.message(
      'SIGN UP',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Take photo`
  String get takePhoto {
    return Intl.message(
      'Take photo',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Select image`
  String get selectImage {
    return Intl.message(
      'Select image',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get createAccount {
    return Intl.message(
      'Create Your Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email address`
  String get enterEmail {
    return Intl.message(
      'Please enter email address',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Password`
  String get enterPassword {
    return Intl.message(
      'Please enter Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `it must have at least 8 digits`
  String get passwordValidation {
    return Intl.message(
      'it must have at least 8 digits',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `this email is not valid`
  String get emailValidation {
    return Intl.message(
      'this email is not valid',
      name: 'emailValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid mobile number`
  String get phoneValidation {
    return Intl.message(
      'Please enter valid mobile number',
      name: 'phoneValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone number`
  String get enterPhone {
    return Intl.message(
      'Please enter phone number',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get enterFullName {
    return Intl.message(
      'Please enter your full name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `You are offline`
  String get offlineMode {
    return Intl.message(
      'You are offline',
      name: 'offlineMode',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
