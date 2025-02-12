import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/core/widgets/buttons/logout_button.dart';
import 'package:ceticy/core/widgets/buttons/theme_button.dart';
import 'package:ceticy/core/widgets/modals/bottom_native_modal.dart';
import 'package:flutter/material.dart';
import 'package:ceticy/views/manager/dashboard_page.dart';
import 'package:ceticy/views/manager/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ManagerNavigation extends StatefulWidget {
  const ManagerNavigation({Key? key}) : super(key: key);

  @override
  ManagerNavigationState createState() => ManagerNavigationState();
}

class ManagerNavigationState extends State<ManagerNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'assets/icons/Settings.svg',
                width: 40,
                height: 40,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
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
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
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
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
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
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
