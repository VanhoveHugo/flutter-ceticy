import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'CETICY';

  @override
  String get about => 'Acerca de';

  @override
  String get menu => 'Menú';

  @override
  String get gallery => 'Galería';

  @override
  String get reviews => 'Reseñas';

  @override
  String get like => 'Me gusta';

  @override
  String get dislike => 'No me gusta';

  @override
  String get superlike => 'Super me gusta';

  @override
  String get language => 'Idioma';

  @override
  String get french => 'Francés';

  @override
  String get english => 'Inglés';

  @override
  String get german => 'Alemán';

  @override
  String get spanish => 'Español';

  @override
  String get featureNotAvailable => 'Función no disponible';

  @override
  String get noImageSelected => 'Ninguna imagen seleccionada';

  @override
  String get addRestaurant => 'Añadir restaurante';

  @override
  String get averagePrice => 'Precio promedio por persona';

  @override
  String get averageWaitTime => 'Tiempo de espera promedio';

  @override
  String get restaurants => 'Restaurantes';

  @override
  String get editRestaurant => 'Editar restaurante';

  @override
  String get noAccount => 'No tengo cuenta';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get openMap => 'Abrir mapa';

  @override
  String get cancel => 'Cancelar';

  @override
  String get open => 'Abrir';

  @override
  String get callRestaurant => 'Llamar al restaurante';

  @override
  String get friendRequestSent => 'Solicitud de amistad enviada';

  @override
  String get error => 'Error';

  @override
  String get deleteAccountWarning1 => 'Sus restaurantes añadidos 🏠';

  @override
  String get deleteAccountWarning2 => 'No podrá recuperar estos datos una vez que se elimine su cuenta.';

  @override
  String get deleteAccountWarning3 => 'Sus encuestas creadas 📊';

  @override
  String subscriptionPaymentRequest(Object offerMessage) {
    return 'Solicitud de pago de suscripción para $offerMessage';
  }

  @override
  String get delete => 'Eliminar';

  @override
  String get deletePoll => 'Eliminar encuesta';

  @override
  String get deletePollConfirmation => '¿Está seguro de que desea continuar?';

  @override
  String get establishmentVisible => 'Establecimiento visible';

  @override
  String get statistics => 'Estadísticas';

  @override
  String get comments => 'Comentarios';

  @override
  String get interests => 'Intereses';

  @override
  String get discoverNewPlaces => 'Descubre nuevos lugares';

  @override
  String get discoverPopularPlaces => 'Descubre los lugares más populares a tu alrededor.';

  @override
  String get discover => 'Descubrir';

  @override
  String get polls => 'Encuestas';

  @override
  String get inProgress => 'En progreso';

  @override
  String get refresh => 'Actualizar';

  @override
  String get survey => 'Encuesta';

  @override
  String get favorites => 'Favoritos';

  @override
  String get profile => 'Perfil';

  @override
  String get settings => 'Ajustes';

  @override
  String get general => 'General';

  @override
  String get accessibility => 'Accesibilidad';

  @override
  String get help => 'Ayuda';

  @override
  String get account => 'Cuenta';

  @override
  String get addFriend => 'Añadir amigo';

  @override
  String get updatePassword => 'Cambiar contraseña';

  @override
  String get updateEmail => 'Cambiar dirección de correo electrónico';

  @override
  String get deleteAccount => 'Eliminar cuenta';

  @override
  String get application => 'Aplicación';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get timeSpent => 'Tiempo invertido';

  @override
  String get privacy => 'Privacidad';

  @override
  String get blockedAndRestricted => 'Bloqueados y restringidos';

  @override
  String get reportProblem => 'Reportar un problema';

  @override
  String get faq => 'Preguntas frecuentes';

  @override
  String get aboutApp => 'Acerca de la aplicación';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get termsOfUse => 'Términos de uso';

  @override
  String get deleteAccountWarning => 'Al eliminar su cuenta, todos sus datos se perderán permanentemente: ';

  @override
  String get iUnderstand => 'Entiendo';

  @override
  String get save => 'Guardar';

  @override
  String get oldEmail => 'Correo electrónico antiguo';

  @override
  String get newEmail => 'Nuevo correo electrónico';

  @override
  String get oldPassword => 'Contraseña antigua';

  @override
  String get newPassword => 'Nueva contraseña';

  @override
  String get confirmNewPassword => 'Confirmar nueva contraseña';

  @override
  String get highContrast => 'Alto contraste';

  @override
  String get highContrastDescription => 'Esta opción aumenta el contraste usando solo blanco y negro en lugar de tonos de gris.';

  @override
  String get audioReading => 'Lectura de audio';

  @override
  String get audioReadingDescription => 'Esta opción permite que la aplicación lea en voz alta las etiquetas y descripciones.';

  @override
  String get voiceCommands => 'Comandos de voz';

  @override
  String get voiceCommandsDescription => 'Esta opción le permite controlar la aplicación usando comandos de voz.';

  @override
  String get reduceAnimations => 'Reducir animaciones';

  @override
  String get reduceAnimationsDescription => 'Esta opción limita las animaciones para reducir el riesgo de mareos.';

  @override
  String get disableNotifications => 'Desactivar notificaciones';

  @override
  String get friends => 'Amigos';

  @override
  String get stories => 'Historias';

  @override
  String get email => 'Correo electrónico';

  @override
  String get pleaseEnterEmail => 'Por favor, ingrese un correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get pleaseEnterPassword => 'Por favor, ingrese una contraseña';

  @override
  String get iAmRestaurant => 'Soy restaurante';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get pleaseEnterUsername => 'Por favor, ingrese un nombre de usuario';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get pleaseConfirmPassword => 'Por favor, confirme la contraseña';

  @override
  String get passwordsDontMatch => 'Las contraseñas no coinciden';

  @override
  String get register => 'Registrarse';

  @override
  String get invalidEmail => 'Por favor, ingrese un correo electrónico válido';

  @override
  String get manager => 'Restaurante';

  @override
  String get surprise => 'Sorpresa';

  @override
  String get surpriseDescription => '¡Deja que el azar elija tu próximo destino culinario!';

  @override
  String get spinWheel => 'Girar la rueda';

  @override
  String get addRestaurantsToWheel => 'Añadir restaurantes a la rueda';

  @override
  String get noRestaurantsInWheel => 'No hay restaurantes en la rueda';

  @override
  String get addRestaurantsToWheelDescription => 'Selecciona los restaurantes que quieres añadir a la rueda de la fortuna';

  @override
  String get selectedRestaurants => 'Restaurantes seleccionados';

  @override
  String get wheelResult => 'Resultado de la rueda';

  @override
  String get congratulations => '¡Enhorabuena!';

  @override
  String get youGot => 'Has obtenido';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get addMoreRestaurants => 'Añadir más restaurantes';

  @override
  String get spinning => 'La roue tourne...';

  @override
  String get infoDev => 'Información de Desarrollo';

  @override
  String get infoDevDescription => 'Información técnica y de desarrollo';

  @override
  String get inDevelopment => 'En Desarrollo';

  @override
  String get featuresInDevelopment => 'Las siguientes funcionalidades están en desarrollo y aún no están disponibles.';

  @override
  String get cuisineTypes => 'Tipos de Cocina';

  @override
  String get clearAll => 'Borrar Todo';

  @override
  String get frenchCuisine => 'Cocina Francesa';

  @override
  String get italianCuisine => 'Cocina Italiana';

  @override
  String get japaneseCuisine => 'Cocina Japonesa';

  @override
  String get chineseCuisine => 'Cocina China';

  @override
  String get indianCuisine => 'Cocina India';

  @override
  String get mexicanCuisine => 'Cocina Mexicana';

  @override
  String get thaiCuisine => 'Cocina Tailandesa';

  @override
  String get vietnameseCuisine => 'Cocina Vietnamita';

  @override
  String get spanishCuisine => 'Cocina Española';

  @override
  String get greekCuisine => 'Cocina Griega';

  @override
  String get lebaneseCuisine => 'Cocina Libanesa';

  @override
  String get moroccanCuisine => 'Cocina Marroquí';

  @override
  String get preferences => 'Preferencias';

  @override
  String get preferencesDescription => 'Cuanto más completo sea tu perfil, más se ajustarán los resultados de búsqueda a tus expectativas.';

  @override
  String get cuisineType => 'Tipo de Cocina';

  @override
  String itemSelected(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seleccionados',
      one: '1 seleccionado',
      zero: '0 seleccionado',
    );
    return '$_temp0';
  }

  @override
  String get ambiance => 'Ambiente';

  @override
  String get theme => 'Temática';

  @override
  String get price => 'Precio';

  @override
  String get service => 'Servicio';

  @override
  String get options => 'Opciones';

  @override
  String get distance => 'Distancia';

  @override
  String get events => 'Eventos';
}
