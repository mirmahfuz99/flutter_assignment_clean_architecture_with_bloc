import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';

class UserEmail extends StatelessWidget {
  final String userEmail;
  const UserEmail({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).primaryColorLight.withOpacity(.3)),
          borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),

      ),
      child:  CustomTextField(
        borderRadius: Dimensions.radiusDefault,
        title: AppConstants.email,
        inputType: TextInputType.emailAddress,
        controller: TextEditingController(text: userEmail),
        isEnabled: false,
      ),
    );
  }
}