
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameInput extends StatelessWidget {
  const UserNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.name != current.name,
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
              prefixIcon: Image.asset(Images.name,scale: 3,),
              title: AppConstants.name,
              hintText: AppConstants.name,
              inputType: TextInputType.name,
              isAutoFocus: true,
              capitalization: TextCapitalization.words,
              onChanged: (name) => context.read<SignUpBloc>().add(SignUpUserNameChanged(name)),

              onValidate: (String? value){
              },
            ),
          );
        });
  }
}