import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/features/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastNameInput extends StatelessWidget {
  final String lastName;
  const LastNameInput({super.key, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
        builder: (context, state){
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border.all(color: Theme.of(context).primaryColorLight.withOpacity(.3)),
              borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
            ),
            child: CustomTextField(
              borderRadius: Dimensions.radiusDefault,
              initialValue: lastName,
              title: AppConstants.lastName,
              hintText: AppConstants.lastName,
              inputType: TextInputType.name,
              capitalization: TextCapitalization.words,
              onChanged: (lastName) => context.read<EditProfileBloc>().add(EditProfileLastNameChanged(lastName)),
              errorText: state.lastName.displayError != null ? "last name can't empty": null,
            ),
          );
        });
  }
}