import 'package:flutter/material.dart';

class CodeCategoryBar extends StatelessWidget {
  const CodeCategoryBar(
      {super.key, required this.title, required this.isChosen});

  final String title;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    assert(title.isNotEmpty, "Tab title can not be empty");
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(41.0),
        color: isChosen ? Colors.black : Colors.transparent,
        border: Border.all(
          color: isChosen ? Colors.transparent : const Color(0xffEBEBEB),
          width: 2.0,
          strokeAlign: StrokeAlign.center,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(
          title,
          style: TextStyle(
            color: isChosen ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
