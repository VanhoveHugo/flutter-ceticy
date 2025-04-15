import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CETICY';

  @override
  String get about => 'About';

  @override
  String get menu => 'Menu';

  @override
  String get gallery => 'Gallery';

  @override
  String get reviews => 'Reviews';

  @override
  String get like => 'Like';

  @override
  String get dislike => 'Dislike';

  @override
  String get superlike => 'Super like';

  @override
  String get language => 'Language';

  @override
  String get french => 'French';

  @override
  String get english => 'English';

  @override
  String get german => 'German';

  @override
  String get spanish => 'Spanish';

  @override
  String get featureNotAvailable => 'Feature not available';

  @override
  String get noImageSelected => 'No image selected';

  @override
  String get addRestaurant => 'Add a restaurant';

  @override
  String get averagePrice => 'Average price per person';

  @override
  String get averageWaitTime => 'Average waiting time';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get editRestaurant => 'Edit your restaurant';

  @override
  String get noAccount => 'I don\'t have an account';

  @override
  String get login => 'Login';

  @override
  String get openMap => 'Open Map';

  @override
  String get cancel => 'Cancel';

  @override
  String get open => 'Open';

  @override
  String get callRestaurant => 'Call restaurant';

  @override
  String get friendRequestSent => 'Friend request sent';

  @override
  String get error => 'Error';

  @override
  String get deleteAccountWarning1 => 'Your added restaurants 🏠';

  @override
  String get deleteAccountWarning2 => 'You will not be able to recover this data once your account is deleted.';

  @override
  String get deleteAccountWarning3 => 'Your created polls 📊';

  @override
  String subscriptionPaymentRequest(Object offerMessage) {
    return 'Payment request for subscription for $offerMessage';
  }

  @override
  String get delete => 'Delete';

  @override
  String get deletePoll => 'Delete poll';

  @override
  String get deletePollConfirmation => 'Are you sure you want to continue?';

  @override
  String get establishmentVisible => 'Establishment visible';

  @override
  String get statistics => 'Statistics';

  @override
  String get comments => 'Comments';

  @override
  String get interests => 'Interests';

  @override
  String get discoverNewPlaces => 'Discover new places';

  @override
  String get discoverPopularPlaces => 'Discover the most popular places around you.';

  @override
  String get discover => 'Discover';

  @override
  String get polls => 'Polls';

  @override
  String get inProgress => 'In progress';

  @override
  String get refresh => 'Refresh';

  @override
  String get survey => 'Survey';

  @override
  String get favorites => 'Favorites';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get general => 'General';

  @override
  String get accessibility => 'Accessibility';

  @override
  String get help => 'Help';

  @override
  String get account => 'Account';

  @override
  String get addFriend => 'Add friend';

  @override
  String get updatePassword => 'Update password';

  @override
  String get updateEmail => 'Update email address';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get application => 'Application';

  @override
  String get notifications => 'Notifications';

  @override
  String get timeSpent => 'Time spent';

  @override
  String get privacy => 'Privacy';

  @override
  String get blockedAndRestricted => 'Blocked and restricted';

  @override
  String get reportProblem => 'Report a problem';

  @override
  String get faq => 'FAQ';

  @override
  String get aboutApp => 'About the application';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get termsOfUse => 'Terms of use';

  @override
  String get deleteAccountWarning => 'By deleting your account, all your data will be permanently lost: ';

  @override
  String get iUnderstand => 'I understand';

  @override
  String get save => 'Save';

  @override
  String get oldEmail => 'Old email';

  @override
  String get newEmail => 'New email';

  @override
  String get oldPassword => 'Old password';

  @override
  String get newPassword => 'New password';

  @override
  String get confirmNewPassword => 'Confirm new password';

  @override
  String get highContrast => 'High contrast';

  @override
  String get highContrastDescription => 'This option increases contrast by using only black and white instead of shades of gray.';

  @override
  String get audioReading => 'Audio reading';

  @override
  String get audioReadingDescription => 'This option allows the application to read labels and descriptions aloud.';

  @override
  String get voiceCommands => 'Voice commands';

  @override
  String get voiceCommandsDescription => 'This option allows you to control the application using voice commands.';

  @override
  String get reduceAnimations => 'Reduce animations';

  @override
  String get reduceAnimationsDescription => 'This option limits animations to reduce the risk of dizziness.';

  @override
  String get disableNotifications => 'Disable notifications';

  @override
  String get friends => 'Friends';

  @override
  String get stories => 'Stories';

  @override
  String get email => 'Email';

  @override
  String get pleaseEnterEmail => 'Veuillez entrer un email';

  @override
  String get password => 'Mot de passe';

  @override
  String get pleaseEnterPassword => 'Veuillez entrer un mot de passe';

  @override
  String get iAmRestaurant => 'Je suis restaurateur';

  @override
  String get username => 'Pseudo';

  @override
  String get pleaseEnterUsername => 'Veuillez entrer un pseudo';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get pleaseConfirmPassword => 'Veuillez confirmer le mot de passe';

  @override
  String get passwordsDontMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get register => 'Je m\'inscris';

  @override
  String get invalidEmail => 'Veuillez entrer un email valide';

  @override
  String get manager => 'Restaurateur';

  @override
  String get surprise => 'Surprise';

  @override
  String get surpriseDescription => 'Laissez le hasard choisir votre prochaine destination culinaire !';

  @override
  String get spinWheel => 'Tourner la roue';

  @override
  String get addRestaurantsToWheel => 'Ajouter des restaurants à la roue';

  @override
  String get noRestaurantsInWheel => 'Aucun restaurant dans la roue';

  @override
  String get addRestaurantsToWheelDescription => 'Sélectionnez les restaurants que vous souhaitez ajouter à la roue de la chance';

  @override
  String get selectedRestaurants => 'Restaurants sélectionnés';

  @override
  String get wheelResult => 'Résultat de la roue';

  @override
  String get congratulations => 'Félicitations !';

  @override
  String get youGot => 'Vous avez obtenu';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get addMoreRestaurants => 'Ajouter plus de restaurants';

  @override
  String get spinning => 'La roue tourne...';

  @override
  String get infoDev => 'Development Info';

  @override
  String get infoDevDescription => 'Technical and development information';

  @override
  String get inDevelopment => 'In Development';

  @override
  String get featuresInDevelopment => 'The features below are under development and are not yet available.';

  @override
  String get cuisineTypes => 'Type de Cuisine';

  @override
  String get clearAll => 'Clear All';

  @override
  String get frenchCuisine => 'French Cuisine';

  @override
  String get italianCuisine => 'Italian Cuisine';

  @override
  String get japaneseCuisine => 'Japanese Cuisine';

  @override
  String get chineseCuisine => 'Chinese Cuisine';

  @override
  String get indianCuisine => 'Indian Cuisine';

  @override
  String get mexicanCuisine => 'Mexican Cuisine';

  @override
  String get thaiCuisine => 'Thai Cuisine';

  @override
  String get vietnameseCuisine => 'Vietnamese Cuisine';

  @override
  String get spanishCuisine => 'Spanish Cuisine';

  @override
  String get greekCuisine => 'Greek Cuisine';

  @override
  String get lebaneseCuisine => 'Lebanese Cuisine';

  @override
  String get moroccanCuisine => 'Moroccan Cuisine';

  @override
  String get preferences => 'Preferences';

  @override
  String get preferencesDescription => 'The more complete your profile is, the more the search results will match your expectations.';

  @override
  String get cuisineType => 'Cuisine Type';

  @override
  String itemSelected(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count selected',
      one: '1 selected',
      zero: '0 selected',
    );
    return '$_temp0';
  }

  @override
  String get ambiance => 'Ambiance';

  @override
  String get theme => 'Theme';

  @override
  String get price => 'Price';

  @override
  String get service => 'Service';

  @override
  String get options => 'Options';

  @override
  String get distance => 'Distance';

  @override
  String get events => 'Events';
}
