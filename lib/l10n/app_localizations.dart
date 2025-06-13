import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// The main title of the application
  ///
  /// In en, this message translates to:
  /// **'Math Labs'**
  String get main_title;

  /// The name of the Calculus course
  ///
  /// In en, this message translates to:
  /// **'Calculus'**
  String get course_calculus;

  /// The topic title for Limit and Continuity in Calculus
  ///
  /// In en, this message translates to:
  /// **'Limit and Continuity'**
  String get topic_calculus_limit;

  /// The settings menu title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Prompt asking for the user's name
  ///
  /// In en, this message translates to:
  /// **'What is your name?'**
  String get name_prompt;

  /// Hint text for the name input field
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get name_hint;

  /// Label for the continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_button;

  /// Toast message for invalid name input
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid name.'**
  String get enter_valid_name_toast;

  /// Section title for appearance settings
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get view_settings;

  /// Label for theme mode selection
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get theme_mode;

  /// Option for system default theme
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get system_default;

  /// Option for light theme
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get light_theme;

  /// Option for dark theme
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get dark_theme;

  /// Label for application color selection
  ///
  /// In en, this message translates to:
  /// **'Application Color'**
  String get app_color;

  /// Option for serene blue color theme
  ///
  /// In en, this message translates to:
  /// **'Serene Blue'**
  String get serene_blue;

  /// Option for red color theme
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get red;

  /// Label for asking the AI assistant
  ///
  /// In en, this message translates to:
  /// **'Ask AI Assistant'**
  String get ask_ai;

  /// Placeholder text for question input
  ///
  /// In en, this message translates to:
  /// **'Ask a question...'**
  String get ask_question;

  /// Label for closing a dialog or window
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Label for sending a message or request
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
