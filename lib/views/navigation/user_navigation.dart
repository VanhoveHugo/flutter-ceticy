import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/core/widgets/buttons/logout_button.dart';
import 'package:ceticy/core/widgets/buttons/theme_button.dart';
import 'package:ceticy/core/widgets/modals/bottom_native_modal.dart';
import 'package:ceticy/core/widgets/modals/notification_modal.dart';
import 'package:ceticy/views/user/home_page.dart';
import 'package:flutter/material.dart';
import 'package:ceticy/views/user/discover_page.dart';
import 'package:ceticy/views/user/favorites_page.dart';
import 'package:ceticy/views/user/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserNavigation extends StatefulWidget {
  const UserNavigation({super.key});

  @override
  UserNavigationState createState() => UserNavigationState();
}

class UserNavigationState extends State<UserNavigation> {
  static final GlobalKey<UserNavigationState> navigationKey = GlobalKey();

  final List<Widget> _pages = [
    const HomePage(),
    const DiscoverPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: navigationKey,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              AppAsset.logo(context),
              width: 100,
            ),
            const Spacer(),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/Notification.svg',
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).bottomNavigationBarTheme.unselectedItemColor
                      as Color,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                NotificationModal.show(context, 'Nouvelle notification',
                    'Vous avez reçu un message de la part de ...');
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/Settings.svg',
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).bottomNavigationBarTheme.unselectedItemColor
                      as Color,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return BottomNativeModal(
                      content: Column(
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                SvgPicture.asset(
                                  AppAsset.getSvg("send"),
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.onSurface,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Partager mon profil',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/friends/create');
                            },
                          ),
                          ListTile(
                            title: Row(
                              children: [
                                SvgPicture.asset(
                                  AppAsset.getSvg("gear"),
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.onSurface,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Paramètres et confidentialité',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                          const SizedBox(height: 16),
                          const ThemeToggleButton(),
                          const SizedBox(height: 16),
                          const LogoutButton()
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: NavigationController.selectedIndex,
        builder: (context, index, child) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: NavigationController.selectedIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (newIndex) {
              setState(() {
                NavigationController.changeIndex(newIndex);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  index == 0
                      ? AppAsset.getSvg("grid")
                      : AppAsset.getSvg("grid_outline"),
                  width: 30,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    index == 0
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor as Color,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Découvrir',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  index == 1
                      ? AppAsset.getSvg("cards")
                      : AppAsset.getSvg("cards_outline"),
                  width: 30,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    index == 1
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor as Color,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Découvrir',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  index == 2
                      ? AppAsset.getSvg("heart")
                      : AppAsset.getSvg("heart_outline"),
                  width: 30,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    index == 2
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor as Color,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Favoris',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  index == 3
                      ? AppAsset.getSvg("user")
                      : AppAsset.getSvg("user_outline"),
                  width: 30,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    index == 3
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor as Color,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Profil',
              ),
            ],
          );
        },
      ),
    );
  }
}

class NavigationController {
  static final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  static void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
