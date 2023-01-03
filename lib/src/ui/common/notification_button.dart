import 'package:flutter/material.dart';

/// Widget is used in AppBar in order to mock
/// the notification button as it was displayed in Figma.
class NotificationButton extends StatefulWidget {
  const NotificationButton({
    super.key,
    required this.height,
    required this.width,
    required this.notificationIndicatorHeight,
    required this.notificationIndicatorWidth,
    required this.onPressed,
  });

  final double width;
  final double height;
  final double notificationIndicatorWidth;
  final double notificationIndicatorHeight;
  final VoidCallback onPressed;

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    assert(widget.width != 0, 'Button width can`t be < 0');
    assert(widget.height != 0, 'Button height can`t be < 0');
    return GestureDetector(
      onTap: widget.onPressed,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset(
              'assets/images/4x/notif.png',
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            ),
            Container(
              width: widget.notificationIndicatorWidth,
              height: widget.notificationIndicatorHeight,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
