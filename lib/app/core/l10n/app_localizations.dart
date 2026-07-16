import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';

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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('ar'),
    Locale('en'),
    Locale('fa'),
    Locale('fr'),
    Locale('hi')
  ];

  /// the current language
  ///
  /// In en, this message translates to:
  /// **'english'**
  String get language;

  /// a programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello world!'**
  String get helloworld;

  /// admin home
  ///
  /// In en, this message translates to:
  /// **'Dashbord'**
  String get dashbord;

  /// progress of the tutor
  ///
  /// In en, this message translates to:
  /// **'Tutor progress'**
  String get tutorprogress;

  /// progress of the student
  ///
  /// In en, this message translates to:
  /// **'Student progress'**
  String get studentprogress;

  /// indicates something needs to be finished or accomplished
  ///
  /// In en, this message translates to:
  /// **'75% completed'**
  String get tocomplete;

  /// indicates something needs to be finished or accomplished
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// indicates something needs to be finished or accomplished
  ///
  /// In en, this message translates to:
  /// **'Complaint'**
  String get complaint;

  /// a particular branch of study, such as mathematics, art, science, etc.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// the study of numbers, quantities, shapes, and patterns
  ///
  /// In en, this message translates to:
  /// **'Mathematics'**
  String get mathematics;

  /// creative expression through various mediums such as painting, sculpture, etc.
  ///
  /// In en, this message translates to:
  /// **'Art'**
  String get art;

  /// the systematic study of the structure and behavior of the physical and natural world
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get science;

  /// the study of the earth's landscapes, environments, and inhabitants
  ///
  /// In en, this message translates to:
  /// **'Geography'**
  String get geography;

  /// the study of past events, particularly in human affairs
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// a programmable electronic device that processes data and performs tasks according to instructions
  ///
  /// In en, this message translates to:
  /// **'Computer'**
  String get computer;

  /// the study of human societies and their interactions
  ///
  /// In en, this message translates to:
  /// **'Social studies'**
  String get socialstudies;

  /// informal greeting or getting someone's attention
  ///
  /// In en, this message translates to:
  /// **'Hey'**
  String get hey;

  /// prompt to search for a desired course or subject to study
  ///
  /// In en, this message translates to:
  /// **'Find a course you want to learn'**
  String get findcourse;

  /// action to find or look up something specific
  ///
  /// In en, this message translates to:
  /// **'Search for anything'**
  String get search;

  /// a grouping or classification of items based on shared characteristics
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// action to view all items or content within a category or list
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeall;

  /// informal greeting or getting someone's attention
  ///
  /// In en, this message translates to:
  /// **'Hi'**
  String get hi;

  /// indicates action related to the entire course or curriculum
  ///
  /// In en, this message translates to:
  /// **'For total course'**
  String get fortotalcourse;

  /// additional subscriptions or options available
  ///
  /// In en, this message translates to:
  /// **'More subs'**
  String get moresubs;

  /// action to include a new subscription or subject
  ///
  /// In en, this message translates to:
  /// **'Add a new sub'**
  String get addnewsub;

  /// notification or reminder about forthcoming payment for a subject
  ///
  /// In en, this message translates to:
  /// **'Upcoming subject payment'**
  String get upcomingsubjectpayment;

  /// services or subjects for which one has paid or agreed to pay regularly
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get subscriptions;

  /// date for making a payment
  ///
  /// In en, this message translates to:
  /// **'Payment date'**
  String get paymentdate;

  /// amount of money expected or required for payment
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// repeating pattern or sequence
  ///
  /// In en, this message translates to:
  /// **'Cycle'**
  String get cycle;

  /// a unit of time, approximately equal to the period of the moon's revolution around the earth
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// relating to one single person or thing
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get individual;

  /// category or classification
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// action to terminate or end a subscription service
  ///
  /// In en, this message translates to:
  /// **'Cancel subscription'**
  String get cancelsubscription;

  /// communication or correspondence between individuals or groups
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// condition or state of affairs
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// options or configurations for customization
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// customization options related to one's account
  ///
  /// In en, this message translates to:
  /// **'Account settings'**
  String get accountsettings;

  /// action to modify or update personal information
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get editprofile;

  /// action to alter or set a new password
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changepassword;

  /// action to include or update a geographical position
  ///
  /// In en, this message translates to:
  /// **'Add location'**
  String get addlocation;

  /// a message or alert delivered to a device or application
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get pushnotification;

  /// display setting that reduces light emission for use in low-light environments
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkmode;

  /// information regarding the organization or individuals behind the product or service
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutus;

  /// issues or worries regarding the protection of personal information
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyconcern;

  /// action to end a session or sign out
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// greeting to newcomers or users entering a platform
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// courses recommended based on user preferences or history
  ///
  /// In en, this message translates to:
  /// **'Suggested for you'**
  String get suggestedyou;

  /// subjects or themes of discussion or study
  ///
  /// In en, this message translates to:
  /// **'Topics'**
  String get topics;

  /// a unit of teaching or learning
  ///
  /// In en, this message translates to:
  /// **'Lesson'**
  String get lession;

  /// unit of time equal to sixty seconds
  ///
  /// In en, this message translates to:
  /// **'Minute(s)'**
  String get min;

  /// No description provided for @featurecourse.
  ///
  /// In en, this message translates to:
  /// **'Featured course'**
  String get featurecourse;

  /// No description provided for @entrollnow.
  ///
  /// In en, this message translates to:
  /// **'Enroll now'**
  String get entrollnow;

  /// action to engage in real-time conversation with other users
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// action to view or manage student profiles
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get students;

  /// No description provided for @hereisyourstatus.
  ///
  /// In en, this message translates to:
  /// **'Here is your status'**
  String get hereisyourstatus;

  /// action to view statistical data or analysis
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// action to view progress in real-time
  ///
  /// In en, this message translates to:
  /// **'Real-time-progress'**
  String get realtimeprogress;

  /// action to view or manage lesson content
  ///
  /// In en, this message translates to:
  /// **'Lesson'**
  String get lesson;

  /// No description provided for @keepprocessing.
  ///
  /// In en, this message translates to:
  /// **'Keep processing'**
  String get keepprocessing;

  /// action to add a new lesson to a course or curriculum
  ///
  /// In en, this message translates to:
  /// **'Add lesson'**
  String get addlesson;

  /// action to cancel or terminate an ongoing process
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// action to modify or change existing data or information
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// action to save changes or data
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// action to set or modify the title of a document, course, or item
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @coverimage.
  ///
  /// In en, this message translates to:
  /// **'Cover image'**
  String get coverimage;

  /// action to add or include something
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @applyasateacher.
  ///
  /// In en, this message translates to:
  /// **'Apply as a teacher'**
  String get applyasateacher;

  /// action to view additional options or information
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;
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
      <String>['ar', 'en', 'fa', 'fr', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
