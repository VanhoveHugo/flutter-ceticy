import 'package:flutter/material.dart';
import 'package:ceticy/src/views/widgets/swipe.dart';
import 'package:ceticy/core/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // image png from assets
            Image.asset(
              'assets/images/logo.png',
              width: 100,
            ),
            const Spacer(),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/Notification.svg',
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/Settings.svg',
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SwipeScreen(),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {},
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.info_outline, color: Colors.white),
                      onPressed: () {},
                    ),
                    const Text(
                      "Info",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  height: 56,
                  width: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: ThemeColor.primary,
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/Heart.svg',
                      width: 30,
                      height: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Cards.svg',
                width: 30,
                height: 30,
                color: ThemeColor.primary,
              ),
              label: 'Découvrir',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Grid.svg',
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              label: 'Parcourir',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Heart.svg',
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              label: 'Favoris',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Messages.svg',
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/User.svg',
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              label: 'Profil',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
