import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis/utils/screen_utils.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import '../ui/styles.dart';
import 'bottom_tab.dart';
import 'routes.dart';

class BottomTabs extends StatelessWidget {
  const BottomTabs({
    Key? key,
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  }) : super(key: key);

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  NavigationTab _buildTab(BuildContext context, int index, String currentTab) {
    final tab = tabs.entries.elementAt(index);
    return NavigationTab(
        key: Key(tab.key),
        isSelected: currentTab == tab.key,
        isDialogTab: index == 1,
        isNavigationrailTab: false,
        icon: tabIcons[tab.key],
        title: tab.value,
        route: tab.key);
  }

  Widget _buildTabTest(BuildContext context, int index, String currentTab) {
    final tab = tabs.entries.elementAt(index);
    final isSelected = currentTab == tab.key;
    final title = tab.value;
    final textStyle = Provider.of<ScreenUtils>(context).text;
    return GestureDetector(
      onTap: () => Routemaster.of(context).push(tab.key),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            '${tabIcons[tab.key] ?? 'assets/icons/cart'}${isSelected ? '-active.svg' : '.svg'}',
            //color: Colors.black,
            //color: isSelected ? CustomColors.orange : Colors.black,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: textStyle.t12400().copyWith(
                color: isSelected ? CustomColors.orange : Colors.black),
          )
        ],
      ),
    );
  }

  double getWidth(BuildContext context) {
    // final dpi = MediaQuery.of(context).devicePixelRatio;
    final width = MediaQuery.of(context).size.width.toInt();
    //logger.d(width);
    //logger.d(MediaQuery.of(context).size.height);
    //logger.d(MediaQuery.of(context).devicePixelRatio.toString());
    //428 390 375 414 320 360
    if (width <= 320) {
      return 1;
    } else if (width <= 360) {
      return 5;
    } else if (width <= 375) {
      return 10;
    } else if (width <= 390) {
      return 15;
    } else if (width <= 414) {
      return 20;
    } else if (width <= 428) {
      return 30;
    } else {
      return 40;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    final currentTab = tabs.keys.toList()[tabPage.index];
    return SizedBox(
      height: 70,
      child: BottomAppBar(
        color: CustomColors.grey2,
        notchMargin: 0,
        child:
            // Row(
            //   children: <Widget>[
            //     const Spacer(),
            //     _buildTabTest(context, 0, currentTab),
            //     const Spacer(),
            //     _buildTabTest(context, 1, currentTab),
            //     const Spacer(),
            //     _buildTabTest(context, 2, currentTab),
            //     const Spacer(),
            //   ],
            // ),

            IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: <Widget>[
              const Spacer(),
              _buildTab(context, 0, currentTab),
              const Spacer(),
              _buildTab(context, 1, currentTab),
              const Spacer(),
              _buildTab(context, 2, currentTab),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
