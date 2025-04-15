import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'CETICY';

  @override
  String get about => 'À propos';

  @override
  String get menu => 'Menu';

  @override
  String get gallery => 'Galerie';

  @override
  String get reviews => 'Avis';

  @override
  String get like => 'J\'aime';

  @override
  String get dislike => 'Je n\'aime pas';

  @override
  String get superlike => 'Super like';

  @override
  String get language => 'Langue';

  @override
  String get french => 'Français';

  @override
  String get english => 'Anglais';

  @override
  String get german => 'Allemand';

  @override
  String get spanish => 'Espagnol';

  @override
  String get featureNotAvailable => 'Fonctionnalité non disponible';

  @override
  String get noImageSelected => 'Aucune image sélectionnée';

  @override
  String get addRestaurant => 'Ajouter un restaurant';

  @override
  String get averagePrice => 'Prix moyen par personne';

  @override
  String get averageWaitTime => 'Temps d\'attente moyen';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get editRestaurant => 'Modifier votre restaurant';

  @override
  String get noAccount => 'Je n\'ai pas de compte';

  @override
  String get login => 'Se connecter';

  @override
  String get openMap => 'Ouvrir la Map';

  @override
  String get cancel => 'Annuler';

  @override
  String get open => 'Ouvrir';

  @override
  String get callRestaurant => 'Appeler le restaurant';

  @override
  String get friendRequestSent => 'Demande d\'ami envoyée';

  @override
  String get error => 'Erreur';

  @override
  String get deleteAccountWarning1 => 'Vos restaurants ajoutés 🏠';

  @override
  String get deleteAccountWarning2 => 'Vous ne pourrez pas récupérer ces données une fois votre compte supprimé.';

  @override
  String get deleteAccountWarning3 => 'Vos sondages créés 📊';

  @override
  String subscriptionPaymentRequest(Object offerMessage) {
    return 'Demande de paiement pour l\'abonnement pour $offerMessage';
  }

  @override
  String get delete => 'Supprimer';

  @override
  String get deletePoll => 'Supprimer le sondage';

  @override
  String get deletePollConfirmation => 'Êtes-vous sûr de vouloir continuer ?';

  @override
  String get establishmentVisible => 'Établissement visible';

  @override
  String get statistics => 'Statistiques';

  @override
  String get comments => 'Commentaires';

  @override
  String get interests => 'Intérêts';

  @override
  String get discoverNewPlaces => 'Découvrez de nouveaux lieux';

  @override
  String get discoverPopularPlaces => 'Découvrez les lieux les plus populaires autour de vous.';

  @override
  String get discover => 'Découvrir';

  @override
  String get polls => 'Sondages';

  @override
  String get inProgress => 'En cours';

  @override
  String get refresh => 'Rafraîchir';

  @override
  String get survey => 'Sondage';

  @override
  String get favorites => 'Favoris';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Paramètres';

  @override
  String get general => 'Général';

  @override
  String get accessibility => 'Accessibilité';

  @override
  String get help => 'Aide';

  @override
  String get account => 'Compte';

  @override
  String get addFriend => 'Ajouter un ami';

  @override
  String get updatePassword => 'Modifier le mot de passe';

  @override
  String get updateEmail => 'Modifier l\'adresse e-mail';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String get application => 'Application';

  @override
  String get notifications => 'Notifications';

  @override
  String get timeSpent => 'Temps passé';

  @override
  String get privacy => 'Confidentialité';

  @override
  String get blockedAndRestricted => 'Bloqués et restreints';

  @override
  String get reportProblem => 'Signaler un problème';

  @override
  String get faq => 'Foire aux questions';

  @override
  String get aboutApp => 'À propos de l\'application';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get deleteAccountWarning => 'En supprimant votre compte, toutes vos données seront définitivement perdues : ';

  @override
  String get iUnderstand => 'Je comprends';

  @override
  String get save => 'Enregistrer';

  @override
  String get oldEmail => 'Ancien email';

  @override
  String get newEmail => 'Nouvel email';

  @override
  String get oldPassword => 'Ancien mot de passe';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get confirmNewPassword => 'Confirmer le nouveau mot de passe';

  @override
  String get highContrast => 'Contraste élevé';

  @override
  String get highContrastDescription => 'Cette option permet d\'augmenter le contraste en se basant uniquement sur du blanc et du noir au lieu des nuances de gris.';

  @override
  String get audioReading => 'Lecture audio';

  @override
  String get audioReadingDescription => 'Cette option permet à l\'application de lire à haute voix les étiquettes et les descriptions de vêtements.';

  @override
  String get voiceCommands => 'Commandes vocales';

  @override
  String get voiceCommandsDescription => 'Cette option permet de contrôler l\'application à l\'aide de commandes vocales.';

  @override
  String get reduceAnimations => 'Réduire les animations';

  @override
  String get reduceAnimationsDescription => 'Cette option permet de limiter les animations pour réduire les risques de vertige.';

  @override
  String get disableNotifications => 'Désactiver les notifications';

  @override
  String get friends => 'Ami.e.s';

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
  String get infoDev => 'Informations de Développement';

  @override
  String get infoDevDescription => 'Informations techniques et de développement';

  @override
  String get inDevelopment => 'En Développement';

  @override
  String get featuresInDevelopment => 'Les fonctionnalités suivantes sont en développement et ne sont pas encore disponibles.';

  @override
  String get cuisineTypes => 'Types de Cuisines';

  @override
  String get clearAll => 'Tout effacer';

  @override
  String get frenchCuisine => 'Cuisine Française';

  @override
  String get italianCuisine => 'Cuisine Italienne';

  @override
  String get japaneseCuisine => 'Cuisine Japonaise';

  @override
  String get chineseCuisine => 'Cuisine Chinoise';

  @override
  String get indianCuisine => 'Cuisine Indienne';

  @override
  String get mexicanCuisine => 'Cuisine Mexicaine';

  @override
  String get thaiCuisine => 'Cuisine Thaïlandaise';

  @override
  String get vietnameseCuisine => 'Cuisine Vietnamienne';

  @override
  String get spanishCuisine => 'Cuisine Espagnole';

  @override
  String get greekCuisine => 'Cuisine Grecque';

  @override
  String get lebaneseCuisine => 'Cuisine Libanaise';

  @override
  String get moroccanCuisine => 'Cuisine Marocaine';

  @override
  String get preferences => 'Préférences';

  @override
  String get preferencesDescription => 'Plus votre profil sera complet, plus les résultats de recherche obtenus correspondront à vos attentes.';

  @override
  String get cuisineType => 'Type de cuisine';

  @override
  String itemSelected(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sélections',
      one: '1 sélection',
      zero: '0 sélection',
    );
    return '$_temp0';
  }

  @override
  String get ambiance => 'Ambiance';

  @override
  String get theme => 'Thématique';

  @override
  String get price => 'Prix';

  @override
  String get service => 'Service';

  @override
  String get options => 'Options';

  @override
  String get distance => 'Distance';

  @override
  String get events => 'Événements';
}
