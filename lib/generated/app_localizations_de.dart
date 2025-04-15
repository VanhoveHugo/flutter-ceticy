import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'CETICY';

  @override
  String get about => 'Über';

  @override
  String get menu => 'Menü';

  @override
  String get gallery => 'Galerie';

  @override
  String get reviews => 'Bewertungen';

  @override
  String get like => 'Gefällt mir';

  @override
  String get dislike => 'Gefällt mir nicht';

  @override
  String get superlike => 'Super gefällt mir';

  @override
  String get language => 'Sprache';

  @override
  String get french => 'Französisch';

  @override
  String get english => 'Englisch';

  @override
  String get german => 'Deutsch';

  @override
  String get spanish => 'Spanisch';

  @override
  String get featureNotAvailable => 'Funktion nicht verfügbar';

  @override
  String get noImageSelected => 'Kein Bild ausgewählt';

  @override
  String get addRestaurant => 'Restaurant hinzufügen';

  @override
  String get averagePrice => 'Durchschnittlicher Preis pro Person';

  @override
  String get averageWaitTime => 'Durchschnittliche Wartezeit';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get editRestaurant => 'Restaurant bearbeiten';

  @override
  String get noAccount => 'Ich habe kein Konto';

  @override
  String get login => 'Anmelden';

  @override
  String get openMap => 'Karte öffnen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get open => 'Öffnen';

  @override
  String get callRestaurant => 'Restaurant anrufen';

  @override
  String get friendRequestSent => 'Freundschaftsanfrage gesendet';

  @override
  String get error => 'Fehler';

  @override
  String get deleteAccountWarning1 => 'Ihre hinzugefügten Restaurants 🏠';

  @override
  String get deleteAccountWarning2 => 'Sie können diese Daten nicht wiederherstellen, sobald Ihr Konto gelöscht wurde.';

  @override
  String get deleteAccountWarning3 => 'Ihre erstellten Umfragen 📊';

  @override
  String subscriptionPaymentRequest(Object offerMessage) {
    return 'Zahlungsanfrage für Abonnement für $offerMessage';
  }

  @override
  String get delete => 'Löschen';

  @override
  String get deletePoll => 'Umfrage löschen';

  @override
  String get deletePollConfirmation => 'Sind Sie sicher, dass Sie fortfahren möchten?';

  @override
  String get establishmentVisible => 'Einrichtung sichtbar';

  @override
  String get statistics => 'Statistiken';

  @override
  String get comments => 'Kommentare';

  @override
  String get interests => 'Interessen';

  @override
  String get discoverNewPlaces => 'Entdecken Sie neue Orte';

  @override
  String get discoverPopularPlaces => 'Entdecken Sie die beliebtesten Orte in Ihrer Umgebung.';

  @override
  String get discover => 'Entdecken';

  @override
  String get polls => 'Umfragen';

  @override
  String get inProgress => 'In Bearbeitung';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get survey => 'Umfrage';

  @override
  String get favorites => 'Favoriten';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Einstellungen';

  @override
  String get general => 'Allgemein';

  @override
  String get accessibility => 'Barrierefreiheit';

  @override
  String get help => 'Hilfe';

  @override
  String get account => 'Konto';

  @override
  String get addFriend => 'Freund hinzufügen';

  @override
  String get updatePassword => 'Passwort ändern';

  @override
  String get updateEmail => 'E-Mail-Adresse ändern';

  @override
  String get deleteAccount => 'Konto löschen';

  @override
  String get application => 'Anwendung';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get timeSpent => 'Verbrachte Zeit';

  @override
  String get privacy => 'Datenschutz';

  @override
  String get blockedAndRestricted => 'Gesperrt und eingeschränkt';

  @override
  String get reportProblem => 'Problem melden';

  @override
  String get faq => 'FAQ';

  @override
  String get aboutApp => 'Über die Anwendung';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get termsOfUse => 'Nutzungsbedingungen';

  @override
  String get deleteAccountWarning => 'Wenn Sie Ihr Konto löschen, gehen alle Ihre Daten unwiderruflich verloren: ';

  @override
  String get iUnderstand => 'Ich verstehe';

  @override
  String get save => 'Speichern';

  @override
  String get oldEmail => 'Alte E-Mail';

  @override
  String get newEmail => 'Neue E-Mail';

  @override
  String get oldPassword => 'Altes Passwort';

  @override
  String get newPassword => 'Neues Passwort';

  @override
  String get confirmNewPassword => 'Neues Passwort bestätigen';

  @override
  String get highContrast => 'Hoher Kontrast';

  @override
  String get highContrastDescription => 'Diese Option erhöht den Kontrast durch die Verwendung von nur Schwarz und Weiß anstelle von Grautönen.';

  @override
  String get audioReading => 'Audio-Lesung';

  @override
  String get audioReadingDescription => 'Diese Option ermöglicht es der Anwendung, Beschriftungen und Beschreibungen vorzulesen.';

  @override
  String get voiceCommands => 'Sprachbefehle';

  @override
  String get voiceCommandsDescription => 'Diese Option ermöglicht es Ihnen, die Anwendung mit Sprachbefehlen zu steuern.';

  @override
  String get reduceAnimations => 'Animationen reduzieren';

  @override
  String get reduceAnimationsDescription => 'Diese Option begrenzt Animationen, um das Risiko von Schwindel zu verringern.';

  @override
  String get disableNotifications => 'Benachrichtigungen deaktivieren';

  @override
  String get friends => 'Freunde';

  @override
  String get stories => 'Geschichten';

  @override
  String get email => 'E-Mail';

  @override
  String get pleaseEnterEmail => 'Bitte geben Sie eine E-Mail-Adresse ein';

  @override
  String get password => 'Passwort';

  @override
  String get pleaseEnterPassword => 'Bitte geben Sie ein Passwort ein';

  @override
  String get iAmRestaurant => 'Ich bin Restaurantbesitzer';

  @override
  String get username => 'Benutzername';

  @override
  String get pleaseEnterUsername => 'Bitte geben Sie einen Benutzernamen ein';

  @override
  String get confirmPassword => 'Passwort bestätigen';

  @override
  String get pleaseConfirmPassword => 'Bitte bestätigen Sie das Passwort';

  @override
  String get passwordsDontMatch => 'Die Passwörter stimmen nicht überein';

  @override
  String get register => 'Registrieren';

  @override
  String get invalidEmail => 'Bitte geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String get manager => 'Restaurantbesitzer';

  @override
  String get surprise => 'Überraschung';

  @override
  String get surpriseDescription => 'Lassen Sie den Zufall Ihr nächstes kulinarisches Ziel wählen!';

  @override
  String get spinWheel => 'Rad drehen';

  @override
  String get addRestaurantsToWheel => 'Restaurants zum Rad hinzufügen';

  @override
  String get noRestaurantsInWheel => 'Keine Restaurants im Rad';

  @override
  String get addRestaurantsToWheelDescription => 'Wählen Sie die Restaurants aus, die Sie zum Glücksrad hinzufügen möchten';

  @override
  String get selectedRestaurants => 'Ausgewählte Restaurants';

  @override
  String get wheelResult => 'Rad-Ergebnis';

  @override
  String get congratulations => 'Glückwunsch!';

  @override
  String get youGot => 'Sie haben';

  @override
  String get tryAgain => 'Nochmal versuchen';

  @override
  String get addMoreRestaurants => 'Weitere Restaurants hinzufügen';

  @override
  String get spinning => 'La roue tourne...';

  @override
  String get infoDev => 'Entwicklungsinformationen';

  @override
  String get infoDevDescription => 'Technische und Entwicklungsinformationen';

  @override
  String get inDevelopment => 'In Entwicklung';

  @override
  String get featuresInDevelopment => 'Die folgenden Funktionen sind in Entwicklung und noch nicht verfügbar.';

  @override
  String get cuisineTypes => 'Küchentypen';

  @override
  String get clearAll => 'Alle löschen';

  @override
  String get frenchCuisine => 'Französische Küche';

  @override
  String get italianCuisine => 'Italienische Küche';

  @override
  String get japaneseCuisine => 'Japanische Küche';

  @override
  String get chineseCuisine => 'Chinesische Küche';

  @override
  String get indianCuisine => 'Indische Küche';

  @override
  String get mexicanCuisine => 'Mexikanische Küche';

  @override
  String get thaiCuisine => 'Thailändische Küche';

  @override
  String get vietnameseCuisine => 'Vietnamesische Küche';

  @override
  String get spanishCuisine => 'Spanische Küche';

  @override
  String get greekCuisine => 'Griechische Küche';

  @override
  String get lebaneseCuisine => 'Libanesische Küche';

  @override
  String get moroccanCuisine => 'Marokkanische Küche';

  @override
  String get preferences => 'Präferenzen';

  @override
  String get preferencesDescription => 'Je vollständiger Ihr Profil ist, desto besser entsprechen die Suchergebnisse Ihren Erwartungen.';

  @override
  String get cuisineType => 'Küchentyp';

  @override
  String itemSelected(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ausgewählt',
      one: '1 ausgewählt',
      zero: '0 ausgewählt',
    );
    return '$_temp0';
  }

  @override
  String get ambiance => 'Atmosphäre';

  @override
  String get theme => 'Thema';

  @override
  String get price => 'Preis';

  @override
  String get service => 'Service';

  @override
  String get options => 'Optionen';

  @override
  String get distance => 'Entfernung';

  @override
  String get events => 'Veranstaltungen';
}
