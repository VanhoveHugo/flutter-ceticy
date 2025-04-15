import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'package:ceticy/views/user/home_page.dart';
import 'package:ceticy/core/widgets/app_bar/app_bar_discover.dart';
import 'package:flutter/material.dart';
import 'package:ceticy/views/user/discover_page.dart';
import 'package:ceticy/views/user/favorites_page.dart';
import 'package:ceticy/views/user/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserNavigation extends StatefulWidget {
  const UserNavigation({super.key});

  @override
  State<UserNavigation> createState() => _UserNavigationState();
}

class _UserNavigationState extends State<UserNavigation> {
  final List<Widget> _pages = [
    const HomePage(),
    const DiscoverPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    NavigationController.selectedIndex.addListener(_onIndexChanged);
  }

  @override
  void dispose() {
    NavigationController.selectedIndex.removeListener(_onIndexChanged);
    super.dispose();
  }

  void _onIndexChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final currentIndex = NavigationController.selectedIndex.value;

    return Scaffold(
      appBar: _buildAppBar(currentIndex),
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          NavigationController.changeIndex(newIndex);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 0
                  ? AppAsset.getSvg("Grid")
                  : AppAsset.getSvg("grid_outline"),
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(
                currentIndex == 0
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor as Color,
                BlendMode.srcIn,
              ),
            ),
            label: localizations.survey,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 1
                  ? AppAsset.getSvg("Cards")
                  : AppAsset.getSvg("cards_outline"),
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(
                currentIndex == 1
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor as Color,
                BlendMode.srcIn,
              ),
            ),
            label: localizations.discover,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 2
                  ? AppAsset.getSvg("Heart")
                  : AppAsset.getSvg("heart_outline"),
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(
                currentIndex == 2
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor as Color,
                BlendMode.srcIn,
              ),
            ),
            label: localizations.favorites,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 3
                  ? AppAsset.getSvg("User")
                  : AppAsset.getSvg("user_outline"),
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(
                currentIndex == 3
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor as Color,
                BlendMode.srcIn,
              ),
            ),
            label: localizations.profile,
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(int index) {
    if (index == 1 || index == 2) {
      return AppBar(title: AppBarDiscover());
    } else if (index == 3) {
      return AppBar(actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Hamburger.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed("/settings");
          },
        ),
        const SizedBox(width: 16),
      ]);
    }
    return null;
  }
}

class NavigationController {
  static final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  static void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
