import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../common/notification_button.dart';

import 'code_category_bar.dart';
import 'code_item_list_view.dart';

class CodePageView extends StatefulWidget {
  const CodePageView({super.key});

  @override
  State<CodePageView> createState() => _CodePageViewState();
}

class _CodePageViewState extends State<CodePageView>
    with SingleTickerProviderStateMixin {
  /// Current tab index
  int _curIndex = 0;

  /// Method updates [_curIndex] to
  /// new index when new tab is chosen.
  void updateIndex(int index) {
    if (index != _curIndex) {
      setState(() => _curIndex = index);
    }
  }

  late TabController categoryTabController;

  @override
  void initState() {
    categoryTabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 21,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.homepageTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            NotificationButton(
              height: 27,
              width: 24,
              notificationIndicatorHeight: 8,
              notificationIndicatorWidth: 8,
              onPressed: () {},
            )
          ],
        ),
        bottom: TabBar(
          controller: categoryTabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          padding: const EdgeInsets.only(left: 21, top: 4, bottom: 4),
          labelPadding: const EdgeInsets.only(right: 8.0),
          indicatorColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          onTap: (value) => updateIndex(value),
          tabs: [
            CodeCategoryBar(
              title: AppLocalizations.of(context)!.allCodes,
              isChosen: _curIndex == 0,
            ),
            CodeCategoryBar(
              title: AppLocalizations.of(context)!.favoriteCodes,
              isChosen: _curIndex == 1,
            ),
            CodeCategoryBar(
              title: AppLocalizations.of(context)!.carCodes,
              isChosen: _curIndex == 2,
            ),
            CodeCategoryBar(
              title: AppLocalizations.of(context)!.addCode,
              isChosen: _curIndex == 3,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: categoryTabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          CodeItemListView(),

          /// Mock data for other categories.
          Center(child: Text('Избранное')),
          Center(child: Text('Машина')),
          Center(child: Text('Добавить')),
        ],
      ),
    );
  }
}
