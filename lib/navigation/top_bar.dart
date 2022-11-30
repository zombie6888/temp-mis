import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../utils/configuration.dart';
import '../utils/screen_utils.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final void Function()? onBackPress;
  final String? title;
  final double? height;
  //final String? webTabTitle;
  final String? subTitle;
  final bool showBackButton;
  final Widget? titleWidget;
  final Widget? leading;
  final double? leadingWidth;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Function()? onTapTitle;
  const TopBar(
      {Key? key,
      this.bottom,
      this.onBackPress,
      this.leading,
      this.height,
      this.leadingWidth,
      this.titleWidget,
      //this.webTabTitle,
      this.title,
      this.showBackButton = true,
      this.onTapTitle,
      this.actions,
      this.subTitle})
      : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize => Size.fromHeight(height ?? appBarHeight);
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Provider.of<ScreenUtils>(context).text;
    final nav = Routemaster.of(context);
    return Container(
      //decoration: BoxDecoration(gradient: orangeGradient()),
      child: AppBar(
          //bottomOpacity: 1,
          //leading: Switch(value: false, onChanged: (bool value) {  },),
          leadingWidth: widget.leadingWidth,
          bottom: widget.bottom,
          // systemOverlayStyle: const SystemUiOverlayStyle(
          //     statusBarIconBrightness: Brightness.light,
          //     statusBarColor: CustomColors.orange,
          //     statusBarBrightness: Brightness.dark),
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
          title: widget.titleWidget ??
              Column(
                children: [
                  if (widget.title != null)
                    GestureDetector(
                        onTap: widget.onTapTitle,
                        child: Text(widget.title!,
                            //title!.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: textStyle
                                .t24600())
                        //        .copyWith(color: Colors.white))
                        // child: Title(
                        //   color: Colors.black,
                        //   title: widget.webTabTitle ?? widget.title!,
                        //   child: Text(
                        //     widget.title!,
                        //     //title!.toUpperCase(),
                        //     textAlign: TextAlign.center,
                        //     style:
                        //         textStyle.t24600().copyWith(color: Colors.white),
                        //   ),
                        // ),
                        ),
                ],
              ),

          //  Column(
          //   children: [
          //     if (title != null)
          //       GestureDetector(
          //         onTap: onTapTitle,
          //         child: titleBuilder != null
          //             ? titleBuilder!(context, title!)
          //             : Title(
          //               color: Colors.black,
          //               title: webTabTitle ?? title!,
          //               child: Text(
          //                   title!,
          //                   //title!.toUpperCase(),
          //                   textAlign: TextAlign.center,
          //                   style:
          //                       textStyle.t24600().copyWith(color: Colors.white),
          //                 ),
          //             ),
          //       ),
          //     if (subTitle != null)
          //       Text(
          //         subTitle!,
          //         textAlign: TextAlign.center,
          //         style: textStyle.t24600(),
          //       ),
          //   ],
          //),
          centerTitle: true,
          leading: widget.showBackButton
              ? IconButton(
                  padding: const EdgeInsets.only(top: 6),
                  onPressed: () {
                    widget.onBackPress != null
                        ? widget.onBackPress?.call()
                        : nav.history.back();
                  },
                  icon: SvgPicture.asset('assets/icons/arrow-back.svg'))
              : widget.leading ?? Container(),
          actions: [if (widget.actions != null) ...widget.actions!],
          elevation: 0.0,
          bottomOpacity: 1),
    );
  }
}
