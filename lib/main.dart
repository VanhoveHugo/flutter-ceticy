import 'package:ceticy/core/app_routes.dart';
import 'package:ceticy/providers/poll_provider.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:ceticy/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ThemeProvider themeProvider = ThemeProvider();
  await themeProvider.loadThemeFromPreferences();

  final AuthProvider authProvider = AuthProvider();
  await authProvider.checkAuthStatus();

  final RestaurantProvider restaurantProvider = RestaurantProvider(authProvider);

  final PollProvider pollProvider = PollProvider(authProvider);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeProvider),
        ChangeNotifierProvider(create: (_) => authProvider),
        ChangeNotifierProvider(create: (_) => restaurantProvider),
        ChangeNotifierProvider(create: (_) => pollProvider),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, ThemeProvider>(
      builder: (context, auth, themeProvider, _) {
        return MaterialApp(
          title: 'Ceticy',
          theme: themeProvider.currentTheme,
          initialRoute: auth.isAuthenticated ? '/' : '/login',
          routes: appRoutes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
