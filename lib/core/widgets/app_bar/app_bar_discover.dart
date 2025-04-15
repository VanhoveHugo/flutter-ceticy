import 'package:ceticy/core/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarDiscover extends StatelessWidget {
  const AppBarDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAsset.logo(context),
          height: 30,
        ),
        const Spacer(),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Notification.svg',
            width: 40,
            height: 40,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            // NotificationModal.show(context, 'Nouvelle notification',
            //     'Vous avez reçu un message de la part de ...');
          },
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Settings.svg',
            width: 40,
            height: 40,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed("/preferences");
          },
        ),
      ],
    );
  }
}
