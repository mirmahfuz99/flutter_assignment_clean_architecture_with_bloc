import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';

class CustomSocialButton extends StatelessWidget {
  final Function()? onPressed;
  final String? iconPath;


  const CustomSocialButton({super.key, this.onPressed, @required this.iconPath,});

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: onPressed,
      child: Container(
          height: 56.0,
          width: 56.0,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
              boxShadow: [BoxShadow(
                offset:  const Offset(0, 3),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.10),
              )]
          ),
          child: Image.asset(iconPath!,scale: 3,)),
    );
  }
}