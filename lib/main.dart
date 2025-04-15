import 'package:ceticy/core/app_routes.dart';
import 'package:ceticy/providers/friend_provider.dart';
import 'package:ceticy/providers/poll_provider.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:ceticy/providers/swipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:ceticy/providers/theme_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ceticy/providers/language_provider.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'providers/preferences_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ThemeProvider themeProvider = ThemeProvider();
  final AuthProvider authProvider = AuthProvider();
  final RestaurantProvider restaurantProvider =
      RestaurantProvider(authProvider);
  final PollProvider pollProvider = PollProvider(authProvider);
  final FriendProvider friendProvider = FriendProvider(authProvider);
  final LanguageProvider languageProvider = LanguageProvider();
  final PreferencesProvider preferencesProvider = PreferencesProvider();
  await themeProvider.loadThemeFromPreferences();
  await authProvider.checkAuthStatus();
  await languageProvider.initPrefs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeProvider),
        ChangeNotifierProvider(create: (_) => authProvider),
        ChangeNotifierProvider(create: (_) => restaurantProvider),
        ChangeNotifierProvider(create: (_) => pollProvider),
        ChangeNotifierProvider(create: (_) => friendProvider),
        ChangeNotifierProvider(create: (_) => SwipeProvider()),
        ChangeNotifierProvider(create: (_) => languageProvider),
        ChangeNotifierProvider(create: (_) => preferencesProvider),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  bool get isDesktopWeb {
    return kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.linux);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, ThemeProvider>(
      builder: (context, auth, themeProvider, _) {
        final app = MaterialApp(
          title: 'Ceticy',
          theme: themeProvider.currentTheme,
          home: AuthChecker(auth: auth),
          routes: appRoutes,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: context.watch<LanguageProvider>().supportedLocales,
          locale: context.watch<LanguageProvider>().currentLocale,
        );

        if (isDesktopWeb) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 430,
                maxHeight: 932,
              ),
              child: app,
            ),
          );
        }

        return app;
      },
    );
  }
}

class AuthChecker extends StatelessWidget {
  final AuthProvider auth;

  const AuthChecker({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeProvider>(context).themeMode;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (auth.isAuthenticated) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            themeMode == AppThemeMode.light ? Brightness.dark : Brightness.dark,
      ),
    );

    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
