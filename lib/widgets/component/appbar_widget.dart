import 'package:flutter/material.dart';
import '../../../../resources/constants/dimensions.dart';
import '../../resources/constants/color.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final GestureTapCallback? onPressed;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool? leadingIcon;
  final List<Widget>? actionWidget;
  const AppBarWidget({super.key,
    required this.title,
    this.onPressed,
    this.iconColor,
    this.backgroundColor,
    required this.leadingIcon,
    this.actionWidget
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColor.whiteColor,
      automaticallyImplyLeading: leadingIcon! ,
      //toolbarHeight: Dimensions.dimen40,
      elevation: 0,
      leading: leadingIcon!?IconButton(
        icon: Icon(Icons.arrow_back, color: iconColor ?? AppColor.blackColor),
        onPressed: onPressed,
      ):null,
      title: title,
      actions: actionWidget
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Dimensions.preferredSize;
}
