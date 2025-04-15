import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/views/user/widgets/info_dev.dart';
import 'package:flutter/material.dart';

class SwipeDescriptionGalery extends StatelessWidget {
  const SwipeDescriptionGalery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoDev(),
        // Grid 3 columns
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(AppAsset.placeholder),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
