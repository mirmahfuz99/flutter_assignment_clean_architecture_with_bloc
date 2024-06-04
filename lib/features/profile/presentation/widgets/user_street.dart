import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';

class UserStreet extends StatelessWidget {
  final String userStreet;
  const UserStreet({super.key, required this.userStreet});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).primaryColorLight.withOpacity(.3)),
          borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),

      ),
      child: const CustomTextField(
        borderRadius: Dimensions.radiusDefault,
        title: AppConstants.email,
        inputType: TextInputType.emailAddress,
        isEnabled: false,
      ),
    );
  }
}