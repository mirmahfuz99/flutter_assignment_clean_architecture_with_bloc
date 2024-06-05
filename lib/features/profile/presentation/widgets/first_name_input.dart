import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/features/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstNameInput extends StatelessWidget {
  final String firstName;
  const FirstNameInput({super.key, required this.firstName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
        buildWhen: (previous, current) => previous.firstName != current.firstName,
        builder: (context, state){
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: Theme.of(context).cardColor.withOpacity(.5)),
                borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
                boxShadow: [BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  color: Colors.black.withOpacity(0.10),
                )]
            ),
            child: CustomTextField(
              title: AppConstants.firstName,
              hintText: AppConstants.firstName,
              initialValue: firstName,
              inputType: TextInputType.name,
              capitalization: TextCapitalization.words,
              onChanged: (firstName) => context.read<EditProfileBloc>().add(EditProfileFirstNameChanged(firstName)),
              errorText: state.firstName.displayError != null ? "first name can't empty": null,

            ),
          );
        });
  }
}