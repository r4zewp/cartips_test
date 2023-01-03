import 'package:flutter/material.dart';

import 'code_item.dart';

class CodeTile extends StatelessWidget {
  const CodeTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CodeItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      textColor: Colors.black,
      leading: SizedBox(
        width: 36,
        height: 37.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(10.28),
              ),
            ),
            Image.asset(
              'assets/images/4x/qr.png',
              width: 18,
              height: 18,
            ),
          ],
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 14.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      tileColor: item.color.withOpacity(0.2),
      onTap: () {},
    );
  }
}
