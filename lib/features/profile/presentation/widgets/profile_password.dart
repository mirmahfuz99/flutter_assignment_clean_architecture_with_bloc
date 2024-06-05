import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';

class ProfilePassword extends StatelessWidget {
  final bool _isExpanded = false;
  const ProfilePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: trailing(context),
      backgroundColor: Colors.transparent,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      enabled: false,
      childrenPadding: const EdgeInsets.all(Dimensions.paddingSizeLarge),

      title: Row(
        children: [
          Image.asset(Images.password,scale: 3,),
          const SizedBox(width: Dimensions.paddingSizeDefault,),
          Text(AppConstants.passwords,style: robotoRegular.copyWith(
              color: Theme.of(context).textTheme.bodySmall!.color!,
              fontSize: Dimensions.fontSizeLarge
          ),),
        ],
      ),
    );
  }

  Widget trailing(context){
    return _isExpanded ?
    RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: Theme.of(context).textTheme.bodySmall!.color!,
        )) :
    Icon(
      Icons.arrow_forward_ios,
      color: Theme.of(context).primaryColorLight,
      size: 12,);
  }
}
