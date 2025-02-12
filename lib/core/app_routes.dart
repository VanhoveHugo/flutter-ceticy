import 'package:ceticy/views/manager/restaurants/restaurant_create_page.dart';
import 'package:ceticy/views/user/friends/friend_create_page.dart';
import 'package:ceticy/views/user/polls/polls_create_page.dart';
import 'package:flutter/material.dart';
import 'package:ceticy/views/auth/login_page.dart';
import 'package:ceticy/views/auth/register_page.dart';
import 'package:ceticy/views/navigation/navigation_wrapper.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const NavigationWrapper(),
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),

  '/restaurants/create': (context) => const RestaurantsCreatePage(),

  '/friends/create': (context) => const FriendsCreatePage(),

  '/polls/create': (context) => const CreatePollPage(),
};
