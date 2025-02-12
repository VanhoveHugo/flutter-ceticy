import 'package:flutter/material.dart';

class NotificationModal {
  static void show(BuildContext context, String title, String message) {
    late final OverlayEntry overlay;
    overlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 50,
          right: 16,
          child: _NotificationWidget(
            title: title,
            message: message,
            onClose: () {
              overlay.remove();
            },
          ),
        );
      },
    );

    Overlay.of(context).insert(overlay);

    Future.delayed(const Duration(seconds: 3), () {
      overlay.remove();
    });
  }
}

class _NotificationWidget extends StatefulWidget {
  final String title;
  final String message;
  final VoidCallback onClose;

  const _NotificationWidget({
    Key? key,
    required this.title,
    required this.message,
    required this.onClose,
  }) : super(key: key);

  @override
  State<_NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<_NotificationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 8,
              ),
            ],
          ),
          width: 300,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.notifications, color: Theme.of(context).colorScheme.onSurface),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.message,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: widget.onClose,
                child: Icon(Icons.close, color: Theme.of(context).colorScheme.onSurface, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
