import 'package:ceticy/core/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onClosePressed;
  final VoidCallback onInfoPressed;
  final VoidCallback onLikePressed;

  const ActionButtons({
    super.key,
    required this.onClosePressed,
    required this.onInfoPressed,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(
            icon: Icon(Icons.close, color: Theme.of(context).colorScheme.surface),
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            onPressed: onClosePressed,
          ),
          TextButton(
            onPressed: onInfoPressed,
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Theme.of(context).colorScheme.onSurface),
                const SizedBox(width: 8),
                Text(
                  "Info",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _buildIconButton(
            icon: SvgPicture.asset(
              AppAsset.getSvg("heart"),
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onPrimary,
                BlendMode.srcIn,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: onLikePressed,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required Widget icon,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        splashColor: Color.fromRGBO(255, 255, 255, 0.1),
        onTap: onPressed,
        borderRadius:
            BorderRadius.circular(16),
        child: Padding(
          padding:
              const EdgeInsets.all(16.0),
          child: icon,
        ),
      ),
    );

  }
}
