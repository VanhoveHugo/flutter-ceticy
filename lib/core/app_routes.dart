import 'package:ceticy/views/auth/login_manager_page.dart';
import 'package:ceticy/views/auth/register/onboarding_manager.dart';
import 'package:ceticy/views/auth/register_manager_page.dart';
import 'package:ceticy/views/manager/restaurants/restaurant_create_page.dart';
import 'package:ceticy/views/manager/restaurants/restaurant_list_page.dart';
import 'package:ceticy/views/user/friends/friend_create_page.dart';
import 'package:ceticy/views/user/polls/polls_create_page.dart';
import 'package:ceticy/views/user/preferences/cuisine_type_page.dart';
import 'package:ceticy/views/user/preferences/ambiance_page.dart';
import 'package:ceticy/views/user/preferences/theme_page.dart';
import 'package:ceticy/views/user/preferences/price_page.dart';
import 'package:ceticy/views/user/preferences/service_page.dart';
import 'package:ceticy/views/user/preferences/options_page.dart';
import 'package:ceticy/views/user/preferences/distance_page.dart';
import 'package:ceticy/views/user/preferences/events_page.dart';
import 'package:ceticy/views/user/preferences/preferences_page.dart';
import 'package:ceticy/views/user/settings/settings_page_accessibility.dart';
import 'package:ceticy/views/user/settings/settings_page_account_delete.dart';
import 'package:ceticy/views/user/settings/settings_page_help.dart';
import 'package:ceticy/views/user/settings/settings_page_language.dart';
import 'package:ceticy/views/user/settings/settings_page_notification.dart';
import 'package:ceticy/views/user/settings/settings_page.dart';
import 'package:ceticy/views/user/settings/settings_page_update_email.dart';
import 'package:ceticy/views/user/settings/settings_page_update_password.dart';
import 'package:flutter/material.dart';
import 'package:ceticy/views/auth/login_page.dart';
import 'package:ceticy/views/auth/register_page.dart';
import 'package:ceticy/views/navigation/navigation_wrapper.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => const NavigationWrapper(),
  '/login': (context) => const LoginPage(),
  '/login/manager': (context) => const LoginManagerPage(),
  '/register': (context) => const RegisterPage(),
  '/register/manager': (context) => const RegisterManagerPage(),
  '/onboarding/manager': (context) => const OnboardingManager(),
  '/preferences': (context) => const PreferencesPage(),
  '/preferences/cuisine-types': (context) => const CuisineTypesPage(),
  '/preferences/ambiances': (context) => const AmbiancePage(),
  '/preferences/themes': (context) => const ThemePage(),
  '/preferences/prices': (context) => const PricePage(),
  '/preferences/services': (context) => const ServicePage(),
  '/preferences/options': (context) => const OptionsPage(),
  '/preferences/distances': (context) => const DistancePage(),
  '/preferences/events': (context) => const EventsPage(),
  '/settings': (context) => const SettingsPage(),
  '/settings/accessibility': (context) => const SettingsPageAccessibility(),
  '/settings/language': (context) => const SettingsPageLanguage(),
  '/settings/help': (context) => const SettingsPageHelp(),
  '/settings/notification': (context) => const SettingsPageNotification(),
  '/settings/update/password': (context) => const SettingsPageUpdatePassword(),
  '/settings/update/email': (context) => const SettingsPageUpdateEmail(),
  '/settings/account/delete': (context) => const SettingsPageAccountDelete(),

  '/restaurants/create': (context) => const RestaurantsCreatePage(),
  '/restaurants/list': (context) => const RestaurantsListPage(),

  '/friends/create': (context) => const FriendsCreatePage(),

  '/polls/create': (context) => const CreatePollPage(),
};
