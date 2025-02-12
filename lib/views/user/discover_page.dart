import 'package:flutter/material.dart';
import 'package:ceticy/views/user/widgets/action_buttons.dart';
import 'package:ceticy/views/user/widgets/swipe_screen.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  bool _isFinished = false;

  final GlobalKey<SwipeScreenState> _swipeScreenKey =
      GlobalKey<SwipeScreenState>();

  void _onStackFinished(bool isFinished) {
    setState(() {
      _isFinished = isFinished;
    });
  }

  void _onClosePressed() {
    _swipeScreenKey.currentState?.triggerNopeAction();
  }

  void _onInfoPressed() {
    _swipeScreenKey.currentState?.triggerSuperLikeAction();
  }

  void _onLikePressed() {
    _swipeScreenKey.currentState?.triggerLikeAction();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SwipeScreen(key: _swipeScreenKey, onStackFinished: _onStackFinished),
          if (!_isFinished)
            ActionButtons(
              onClosePressed: _onClosePressed,
              onInfoPressed: _onInfoPressed,
              onLikePressed: _onLikePressed,
            ),
        ],
      ),
    );
  }
}
