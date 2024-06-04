import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_button.dart';
import 'package:flutter_assignment/features/profile/data/models/user.dart';
import 'package:flutter_assignment/features/profile/presentation/widgets/first_name_input.dart';
import 'package:flutter_assignment/features/profile/presentation/widgets/full_name_input.dart';
import 'package:flutter_assignment/features/profile/presentation/widgets/last_name_input.dart';
import 'package:flutter_assignment/features/profile/presentation/widgets/user_apt_suit.dart';
import 'package:flutter_assignment/features/profile/presentation/widgets/user_street.dart';
import 'package:flutter_assignment/features/profile/presentation/widgets/zip_code.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';

import 'user_email.dart';

class ProfileAccountSection extends StatefulWidget {
  final User user;
  const ProfileAccountSection({super.key, required this.user});

  @override
  State<ProfileAccountSection> createState() => _ProfileAccountSectionState();
}

class _ProfileAccountSectionState extends State<ProfileAccountSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: trailing(),
      onExpansionChanged: (bool expanded) {
        setState(() => _isExpanded = expanded);
      },
      backgroundColor: Colors.transparent,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.all(Dimensions.paddingSizeLarge),


      title: Row(
        children: [
          Image.asset(Images.name,scale: 3,),
          const SizedBox(width: Dimensions.paddingSizeDefault,),
          Text(AppConstants.account,style: robotoRegular.copyWith(
              fontSize: Dimensions.fontSizeLarge
          ),),
        ],
      ),
      children: [
        Text(AppConstants.email,style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5),
            fontSize: Dimensions.fontSizeLarge),),
        const SizedBox(height: Dimensions.paddingSizeSmall,),
        UserEmail(userEmail: widget.user.userEmail!,),


        const SizedBox(height: Dimensions.paddingSizeDefault,),
        Text(AppConstants.firstName,style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5),
            fontSize: Dimensions.fontSizeLarge),),
        const SizedBox(height: Dimensions.paddingSizeSmall,),
        const FirstNameInput(),

        const SizedBox(height: Dimensions.paddingSizeDefault,),
        Text(AppConstants.lastName,style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5),
            fontSize: Dimensions.fontSizeLarge),),
        const SizedBox(height: Dimensions.paddingSizeSmall,),
        const LastNameInput(),


        const SizedBox(height: Dimensions.paddingSizeDefault,),

        Text(AppConstants.fullName,style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5),
            fontSize: Dimensions.fontSizeLarge),),
        const SizedBox(height: Dimensions.paddingSizeSmall,),
        FullNameInput(userEmail: widget.user.userDisplayName!,),

        Text(AppConstants.streetAddress,style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5),
            fontSize: Dimensions.fontSizeLarge),),
        const SizedBox(height: Dimensions.paddingSizeSmall,),
        const UserStreet(userStreet: "465 Nolan Causeway Suite 079",),
        const SizedBox(height: Dimensions.paddingSizeDefault,),

        Text(AppConstants.aptSuiteBldg,style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5),
            fontSize: Dimensions.fontSizeLarge),),
        const SizedBox(height: Dimensions.paddingSizeSmall,),
        const UserAptSuit(userAptSuit: 'Unit 512',),
        const SizedBox(height: Dimensions.paddingSizeDefault,),

        Text(AppConstants.zipCode,style: robotoRegular.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5),
            fontSize: Dimensions.fontSizeLarge),),
        const SizedBox(height: Dimensions.paddingSizeSmall,),
        const UserZipCode(userZipCode: "77017",),
        const SizedBox(height: Dimensions.paddingSizeExtraLarge,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                print("tapped");
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.6,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius:  const BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
                  border: Border.all(color: Theme.of(context).primaryColorLight.withOpacity(.3)),
                ),
                child: Center(child: Text(AppConstants.cancel,style: robotoBold.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),)),
              ),
            ),
            CustomButton(
                height: 50,
                backgroundColor: const Color(0xff1ABC9C),
                width: MediaQuery.of(context).size.width / 2.6,
                buttonText: AppConstants.save)
          ],
        )


      ],
    );
  }

  Widget trailing(){
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
