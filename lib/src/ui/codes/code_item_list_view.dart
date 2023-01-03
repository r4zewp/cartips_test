import 'package:flutter/material.dart';

import 'code_item.dart';
import 'code_tile.dart';

/// Displays a list of SampleItems.
class CodeItemListView extends StatefulWidget {
  const CodeItemListView({
    super.key,

    /// If there's an API giving information about codes,
    /// then solution about color distribution would be different.
    ///
    /// I've decided to do it this way because of mock data.
    this.items = const [
      CodeItem(name: "Моя машина", color: Color(0xff4385F6)),
      CodeItem(name: "Мой ребенок", color: Color(0xffCDC1FF)),
      CodeItem(name: "Моя квартира", color: Color(0xff7AE582)),
      CodeItem(name: "Мой кошелек", color: Color(0xff71BBFF)),
      CodeItem(name: "Мой телефон", color: Color(0xff77EDD9)),
    ],
  });

  final List<CodeItem> items;

  @override
  State<CodeItemListView> createState() => _CodeItemListViewState();
}

class _CodeItemListViewState extends State<CodeItemListView>
    with SingleTickerProviderStateMixin {
  /// ScrollController for codes
  ScrollController codesScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26.0),
      child: Center(
        /// Scrollbar is only shown when
        /// there's not enough place to display tiles.
        child: Scrollbar(
          thickness: 4,
          thumbVisibility: true,
          controller: codesScrollController,
          child: ListView.builder(
            controller: codesScrollController,
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = widget.items[index];
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 14.0,
                  left: 21,
                  right: 21,
                ),
                child: CodeTile(item: item),
              );
            },
          ),
        ),
      ),
    );
  }
}
