import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr')
  ];

  /// Le titre de l'application
  ///
  /// In fr, this message translates to:
  /// **'CETICY'**
  String get appTitle;

  /// No description provided for @about.
  ///
  /// In fr, this message translates to:
  /// **'À propos'**
  String get about;

  /// No description provided for @menu.
  ///
  /// In fr, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @gallery.
  ///
  /// In fr, this message translates to:
  /// **'Galerie'**
  String get gallery;

  /// No description provided for @reviews.
  ///
  /// In fr, this message translates to:
  /// **'Avis'**
  String get reviews;

  /// No description provided for @like.
  ///
  /// In fr, this message translates to:
  /// **'J\'aime'**
  String get like;

  /// No description provided for @dislike.
  ///
  /// In fr, this message translates to:
  /// **'Je n\'aime pas'**
  String get dislike;

  /// No description provided for @superlike.
  ///
  /// In fr, this message translates to:
  /// **'Super like'**
  String get superlike;

  /// Le titre de la page des langues
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get language;

  /// No description provided for @french.
  ///
  /// In fr, this message translates to:
  /// **'Français'**
  String get french;

  /// No description provided for @english.
  ///
  /// In fr, this message translates to:
  /// **'Anglais'**
  String get english;

  /// No description provided for @german.
  ///
  /// In fr, this message translates to:
  /// **'Allemand'**
  String get german;

  /// No description provided for @spanish.
  ///
  /// In fr, this message translates to:
  /// **'Espagnol'**
  String get spanish;

  /// No description provided for @featureNotAvailable.
  ///
  /// In fr, this message translates to:
  /// **'Fonctionnalité non disponible'**
  String get featureNotAvailable;

  /// No description provided for @noImageSelected.
  ///
  /// In fr, this message translates to:
  /// **'Aucune image sélectionnée'**
  String get noImageSelected;

  /// No description provided for @addRestaurant.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un restaurant'**
  String get addRestaurant;

  /// No description provided for @averagePrice.
  ///
  /// In fr, this message translates to:
  /// **'Prix moyen par personne'**
  String get averagePrice;

  /// No description provided for @averageWaitTime.
  ///
  /// In fr, this message translates to:
  /// **'Temps d\'attente moyen'**
  String get averageWaitTime;

  /// No description provided for @restaurants.
  ///
  /// In fr, this message translates to:
  /// **'Restaurants'**
  String get restaurants;

  /// No description provided for @editRestaurant.
  ///
  /// In fr, this message translates to:
  /// **'Modifier votre restaurant'**
  String get editRestaurant;

  /// No description provided for @noAccount.
  ///
  /// In fr, this message translates to:
  /// **'Je n\'ai pas de compte'**
  String get noAccount;

  /// No description provided for @login.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get login;

  /// No description provided for @openMap.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir la Map'**
  String get openMap;

  /// No description provided for @cancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancel;

  /// No description provided for @open.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir'**
  String get open;

  /// No description provided for @callRestaurant.
  ///
  /// In fr, this message translates to:
  /// **'Appeler le restaurant'**
  String get callRestaurant;

  /// No description provided for @friendRequestSent.
  ///
  /// In fr, this message translates to:
  /// **'Demande d\'ami envoyée'**
  String get friendRequestSent;

  /// No description provided for @error.
  ///
  /// In fr, this message translates to:
  /// **'Erreur'**
  String get error;

  /// No description provided for @deleteAccountWarning1.
  ///
  /// In fr, this message translates to:
  /// **'Vos restaurants ajoutés 🏠'**
  String get deleteAccountWarning1;

  /// No description provided for @deleteAccountWarning2.
  ///
  /// In fr, this message translates to:
  /// **'Vous ne pourrez pas récupérer ces données une fois votre compte supprimé.'**
  String get deleteAccountWarning2;

  /// No description provided for @deleteAccountWarning3.
  ///
  /// In fr, this message translates to:
  /// **'Vos sondages créés 📊'**
  String get deleteAccountWarning3;

  /// No description provided for @subscriptionPaymentRequest.
  ///
  /// In fr, this message translates to:
  /// **'Demande de paiement pour l\'abonnement pour {offerMessage}'**
  String subscriptionPaymentRequest(Object offerMessage);

  /// No description provided for @delete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get delete;

  /// No description provided for @deletePoll.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer le sondage'**
  String get deletePoll;

  /// No description provided for @deletePollConfirmation.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de vouloir continuer ?'**
  String get deletePollConfirmation;

  /// No description provided for @establishmentVisible.
  ///
  /// In fr, this message translates to:
  /// **'Établissement visible'**
  String get establishmentVisible;

  /// No description provided for @statistics.
  ///
  /// In fr, this message translates to:
  /// **'Statistiques'**
  String get statistics;

  /// No description provided for @comments.
  ///
  /// In fr, this message translates to:
  /// **'Commentaires'**
  String get comments;

  /// No description provided for @interests.
  ///
  /// In fr, this message translates to:
  /// **'Intérêts'**
  String get interests;

  /// No description provided for @discoverNewPlaces.
  ///
  /// In fr, this message translates to:
  /// **'Découvrez de nouveaux lieux'**
  String get discoverNewPlaces;

  /// No description provided for @discoverPopularPlaces.
  ///
  /// In fr, this message translates to:
  /// **'Découvrez les lieux les plus populaires autour de vous.'**
  String get discoverPopularPlaces;

  /// No description provided for @discover.
  ///
  /// In fr, this message translates to:
  /// **'Découvrir'**
  String get discover;

  /// No description provided for @polls.
  ///
  /// In fr, this message translates to:
  /// **'Sondages'**
  String get polls;

  /// No description provided for @inProgress.
  ///
  /// In fr, this message translates to:
  /// **'En cours'**
  String get inProgress;

  /// No description provided for @refresh.
  ///
  /// In fr, this message translates to:
  /// **'Rafraîchir'**
  String get refresh;

  /// No description provided for @survey.
  ///
  /// In fr, this message translates to:
  /// **'Sondage'**
  String get survey;

  /// No description provided for @favorites.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get favorites;

  /// No description provided for @profile.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settings;

  /// No description provided for @general.
  ///
  /// In fr, this message translates to:
  /// **'Général'**
  String get general;

  /// No description provided for @accessibility.
  ///
  /// In fr, this message translates to:
  /// **'Accessibilité'**
  String get accessibility;

  /// No description provided for @help.
  ///
  /// In fr, this message translates to:
  /// **'Aide'**
  String get help;

  /// No description provided for @account.
  ///
  /// In fr, this message translates to:
  /// **'Compte'**
  String get account;

  /// No description provided for @addFriend.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un ami'**
  String get addFriend;

  /// No description provided for @updatePassword.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le mot de passe'**
  String get updatePassword;

  /// No description provided for @updateEmail.
  ///
  /// In fr, this message translates to:
  /// **'Modifier l\'adresse e-mail'**
  String get updateEmail;

  /// No description provided for @deleteAccount.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer le compte'**
  String get deleteAccount;

  /// No description provided for @application.
  ///
  /// In fr, this message translates to:
  /// **'Application'**
  String get application;

  /// No description provided for @notifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @timeSpent.
  ///
  /// In fr, this message translates to:
  /// **'Temps passé'**
  String get timeSpent;

  /// No description provided for @privacy.
  ///
  /// In fr, this message translates to:
  /// **'Confidentialité'**
  String get privacy;

  /// No description provided for @blockedAndRestricted.
  ///
  /// In fr, this message translates to:
  /// **'Bloqués et restreints'**
  String get blockedAndRestricted;

  /// No description provided for @reportProblem.
  ///
  /// In fr, this message translates to:
  /// **'Signaler un problème'**
  String get reportProblem;

  /// No description provided for @faq.
  ///
  /// In fr, this message translates to:
  /// **'Foire aux questions'**
  String get faq;

  /// No description provided for @aboutApp.
  ///
  /// In fr, this message translates to:
  /// **'À propos de l\'application'**
  String get aboutApp;

  /// No description provided for @privacyPolicy.
  ///
  /// In fr, this message translates to:
  /// **'Politique de confidentialité'**
  String get privacyPolicy;

  /// No description provided for @termsOfUse.
  ///
  /// In fr, this message translates to:
  /// **'Conditions d\'utilisation'**
  String get termsOfUse;

  /// No description provided for @deleteAccountWarning.
  ///
  /// In fr, this message translates to:
  /// **'En supprimant votre compte, toutes vos données seront définitivement perdues : '**
  String get deleteAccountWarning;

  /// No description provided for @iUnderstand.
  ///
  /// In fr, this message translates to:
  /// **'Je comprends'**
  String get iUnderstand;

  /// No description provided for @save.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get save;

  /// No description provided for @oldEmail.
  ///
  /// In fr, this message translates to:
  /// **'Ancien email'**
  String get oldEmail;

  /// No description provided for @newEmail.
  ///
  /// In fr, this message translates to:
  /// **'Nouvel email'**
  String get newEmail;

  /// No description provided for @oldPassword.
  ///
  /// In fr, this message translates to:
  /// **'Ancien mot de passe'**
  String get oldPassword;

  /// No description provided for @newPassword.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau mot de passe'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le nouveau mot de passe'**
  String get confirmNewPassword;

  /// No description provided for @highContrast.
  ///
  /// In fr, this message translates to:
  /// **'Contraste élevé'**
  String get highContrast;

  /// No description provided for @highContrastDescription.
  ///
  /// In fr, this message translates to:
  /// **'Cette option permet d\'augmenter le contraste en se basant uniquement sur du blanc et du noir au lieu des nuances de gris.'**
  String get highContrastDescription;

  /// No description provided for @audioReading.
  ///
  /// In fr, this message translates to:
  /// **'Lecture audio'**
  String get audioReading;

  /// No description provided for @audioReadingDescription.
  ///
  /// In fr, this message translates to:
  /// **'Cette option permet à l\'application de lire à haute voix les étiquettes et les descriptions de vêtements.'**
  String get audioReadingDescription;

  /// No description provided for @voiceCommands.
  ///
  /// In fr, this message translates to:
  /// **'Commandes vocales'**
  String get voiceCommands;

  /// No description provided for @voiceCommandsDescription.
  ///
  /// In fr, this message translates to:
  /// **'Cette option permet de contrôler l\'application à l\'aide de commandes vocales.'**
  String get voiceCommandsDescription;

  /// No description provided for @reduceAnimations.
  ///
  /// In fr, this message translates to:
  /// **'Réduire les animations'**
  String get reduceAnimations;

  /// No description provided for @reduceAnimationsDescription.
  ///
  /// In fr, this message translates to:
  /// **'Cette option permet de limiter les animations pour réduire les risques de vertige.'**
  String get reduceAnimationsDescription;

  /// No description provided for @disableNotifications.
  ///
  /// In fr, this message translates to:
  /// **'Désactiver les notifications'**
  String get disableNotifications;

  /// No description provided for @friends.
  ///
  /// In fr, this message translates to:
  /// **'Ami.e.s'**
  String get friends;

  /// No description provided for @stories.
  ///
  /// In fr, this message translates to:
  /// **'Stories'**
  String get stories;

  /// No description provided for @email.
  ///
  /// In fr, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez entrer un email'**
  String get pleaseEnterEmail;

  /// No description provided for @password.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get password;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez entrer un mot de passe'**
  String get pleaseEnterPassword;

  /// No description provided for @iAmRestaurant.
  ///
  /// In fr, this message translates to:
  /// **'Je suis restaurateur'**
  String get iAmRestaurant;

  /// No description provided for @username.
  ///
  /// In fr, this message translates to:
  /// **'Pseudo'**
  String get username;

  /// No description provided for @pleaseEnterUsername.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez entrer un pseudo'**
  String get pleaseEnterUsername;

  /// No description provided for @confirmPassword.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le mot de passe'**
  String get confirmPassword;

  /// No description provided for @pleaseConfirmPassword.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez confirmer le mot de passe'**
  String get pleaseConfirmPassword;

  /// No description provided for @passwordsDontMatch.
  ///
  /// In fr, this message translates to:
  /// **'Les mots de passe ne correspondent pas'**
  String get passwordsDontMatch;

  /// No description provided for @register.
  ///
  /// In fr, this message translates to:
  /// **'Je m\'inscris'**
  String get register;

  /// No description provided for @invalidEmail.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez entrer un email valide'**
  String get invalidEmail;

  /// No description provided for @manager.
  ///
  /// In fr, this message translates to:
  /// **'Restaurateur'**
  String get manager;

  /// No description provided for @surprise.
  ///
  /// In fr, this message translates to:
  /// **'Surprise'**
  String get surprise;

  /// No description provided for @surpriseDescription.
  ///
  /// In fr, this message translates to:
  /// **'Laissez le hasard choisir votre prochaine destination culinaire !'**
  String get surpriseDescription;

  /// No description provided for @spinWheel.
  ///
  /// In fr, this message translates to:
  /// **'Tourner la roue'**
  String get spinWheel;

  /// No description provided for @addRestaurantsToWheel.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter des restaurants à la roue'**
  String get addRestaurantsToWheel;

  /// No description provided for @noRestaurantsInWheel.
  ///
  /// In fr, this message translates to:
  /// **'Aucun restaurant dans la roue'**
  String get noRestaurantsInWheel;

  /// No description provided for @addRestaurantsToWheelDescription.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez les restaurants que vous souhaitez ajouter à la roue de la chance'**
  String get addRestaurantsToWheelDescription;

  /// No description provided for @selectedRestaurants.
  ///
  /// In fr, this message translates to:
  /// **'Restaurants sélectionnés'**
  String get selectedRestaurants;

  /// No description provided for @wheelResult.
  ///
  /// In fr, this message translates to:
  /// **'Résultat de la roue'**
  String get wheelResult;

  /// No description provided for @congratulations.
  ///
  /// In fr, this message translates to:
  /// **'Félicitations !'**
  String get congratulations;

  /// No description provided for @youGot.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez obtenu'**
  String get youGot;

  /// No description provided for @tryAgain.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get tryAgain;

  /// No description provided for @addMoreRestaurants.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter plus de restaurants'**
  String get addMoreRestaurants;

  /// No description provided for @spinning.
  ///
  /// In fr, this message translates to:
  /// **'La roue tourne...'**
  String get spinning;

  /// No description provided for @infoDev.
  ///
  /// In fr, this message translates to:
  /// **'Informations de Développement'**
  String get infoDev;

  /// No description provided for @infoDevDescription.
  ///
  /// In fr, this message translates to:
  /// **'Informations techniques et de développement'**
  String get infoDevDescription;

  /// No description provided for @inDevelopment.
  ///
  /// In fr, this message translates to:
  /// **'En Développement'**
  String get inDevelopment;

  /// No description provided for @featuresInDevelopment.
  ///
  /// In fr, this message translates to:
  /// **'Les fonctionnalités suivantes sont en développement et ne sont pas encore disponibles.'**
  String get featuresInDevelopment;

  /// No description provided for @cuisineTypes.
  ///
  /// In fr, this message translates to:
  /// **'Types de Cuisines'**
  String get cuisineTypes;

  /// No description provided for @clearAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout effacer'**
  String get clearAll;

  /// No description provided for @frenchCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Française'**
  String get frenchCuisine;

  /// No description provided for @italianCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Italienne'**
  String get italianCuisine;

  /// No description provided for @japaneseCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Japonaise'**
  String get japaneseCuisine;

  /// No description provided for @chineseCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Chinoise'**
  String get chineseCuisine;

  /// No description provided for @indianCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Indienne'**
  String get indianCuisine;

  /// No description provided for @mexicanCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Mexicaine'**
  String get mexicanCuisine;

  /// No description provided for @thaiCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Thaïlandaise'**
  String get thaiCuisine;

  /// No description provided for @vietnameseCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Vietnamienne'**
  String get vietnameseCuisine;

  /// No description provided for @spanishCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Espagnole'**
  String get spanishCuisine;

  /// No description provided for @greekCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Grecque'**
  String get greekCuisine;

  /// No description provided for @lebaneseCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Libanaise'**
  String get lebaneseCuisine;

  /// No description provided for @moroccanCuisine.
  ///
  /// In fr, this message translates to:
  /// **'Cuisine Marocaine'**
  String get moroccanCuisine;

  /// No description provided for @preferences.
  ///
  /// In fr, this message translates to:
  /// **'Préférences'**
  String get preferences;

  /// No description provided for @preferencesDescription.
  ///
  /// In fr, this message translates to:
  /// **'Plus votre profil sera complet, plus les résultats de recherche obtenus correspondront à vos attentes.'**
  String get preferencesDescription;

  /// No description provided for @cuisineType.
  ///
  /// In fr, this message translates to:
  /// **'Type de cuisine'**
  String get cuisineType;

  /// No description provided for @itemSelected.
  ///
  /// In fr, this message translates to:
  /// **'{count,plural, =0{0 sélection} =1{1 sélection} other{{count} sélections}}'**
  String itemSelected(num count);

  /// No description provided for @ambiance.
  ///
  /// In fr, this message translates to:
  /// **'Ambiance'**
  String get ambiance;

  /// No description provided for @theme.
  ///
  /// In fr, this message translates to:
  /// **'Thématique'**
  String get theme;

  /// No description provided for @price.
  ///
  /// In fr, this message translates to:
  /// **'Prix'**
  String get price;

  /// No description provided for @service.
  ///
  /// In fr, this message translates to:
  /// **'Service'**
  String get service;

  /// No description provided for @options.
  ///
  /// In fr, this message translates to:
  /// **'Options'**
  String get options;

  /// No description provided for @distance.
  ///
  /// In fr, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @events.
  ///
  /// In fr, this message translates to:
  /// **'Événements'**
  String get events;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
