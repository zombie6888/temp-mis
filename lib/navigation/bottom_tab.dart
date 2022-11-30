import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis/utils/screen_utils.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../ui/styles.dart';
import '../ui/text.dart';

class NavigationTab extends StatelessWidget {
  final bool isDialogTab;
  final bool isNavigationrailTab;
  const NavigationTab(
      {Key? key,
      required this.isSelected,
      required this.icon,
      this.isNavigationrailTab = false,
      this.isDialogTab = false,
      required this.title,
      required this.route})
      : super(key: key);

  final bool isSelected;
  final String? icon;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    final textStyle = Provider.of<ScreenUtils>(context).text;
    return Stack(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            primary: Colors.black54,
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon(icon,
                //     size: 32,
                //     color:
                //         isSelected ? MentoryColors.main : MentoryColors.disabled),
                SvgPicture.asset(
                  //'${icon ?? 'assets/icons/cart'}${isSelected ? '-active.svg' : '.svg'}'
                  icon ?? 'assets/icons/cart',
                  color: isSelected ? CustomColors.brandLight : Colors.black,
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: textStyle.t12400().copyWith(
                      color: isSelected ? CustomColors.brandLight : Colors.black),
                )
              ],
            ),
          ),
          onPressed: () => Routemaster.of(context).push(route),
        ),
      ],
    );
  }
}
