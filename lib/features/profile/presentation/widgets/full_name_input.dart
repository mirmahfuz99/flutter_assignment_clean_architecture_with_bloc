import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullNameInput extends StatelessWidget {
  final String fullName;
  const FullNameInput({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: Theme.of(context).primaryColorLight.withOpacity(.3)),
        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),

      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Text(
            fullName,
            style:robotoRegular.copyWith(fontSize:Dimensions.fontSizeDefault,color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}