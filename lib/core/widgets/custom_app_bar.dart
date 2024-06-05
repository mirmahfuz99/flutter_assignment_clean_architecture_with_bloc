import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/styles.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isBackButtonExist;
  final Function()? onBackPressed;
  final bool? showCart;
  final bool? centerTitle;
  final Color? bgColor;
  final Color? titleColor;
  final List<Widget>? actions;
  const CustomAppBar(
      {super.key,
      this.title = '',
      this.isBackButtonExist = true,
      this.onBackPressed,
      this.showCart = false,
      this.centerTitle = true,
      this.bgColor,
      this.titleColor,
      this.actions = const [SizedBox()]});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!,
        style: robotoBold.copyWith(
            fontSize: Dimensions.fontSizeExtraLarge,
            color: titleColor ?? Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.8)),
      ),
      centerTitle: centerTitle,
      automaticallyImplyLeading: true,
      leading: isBackButtonExist!
          ? IconButton(
        splashRadius: Dimensions.paddingSizeLarge,
        hoverColor: Colors.transparent,
        icon: Icon(Icons.arrow_back, color: titleColor ?? Theme.of(context).primaryColorLight),
        color: Theme.of(context).textTheme.bodyLarge!.color,
        onPressed: () => onBackPressed != null
            ? onBackPressed!()
            : Navigator.pop(context),
      )
          : const SizedBox(),
      backgroundColor: bgColor ?? Theme.of(context).primaryColor,
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(1000,70);
}
