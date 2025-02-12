import 'package:flutter/material.dart';

class BottomNativeModal extends StatelessWidget {
  final Widget content;
  const BottomNativeModal({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.4,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 5,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                children: [
                  content,
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
