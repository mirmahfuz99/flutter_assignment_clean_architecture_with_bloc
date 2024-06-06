import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameInput extends StatelessWidget {
  const UserNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.username != current.username,
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
              prefixIcon: Image.asset(Images.email,scale: 3,),
              title: AppConstants.email,
              hintText: AppConstants.email,
              isAutoFocus: true,
              capitalization: TextCapitalization.words,
              onChanged: (username) => context.read<LoginBloc>().add(LoginUsernameChanged(username)),
              errorText: state.username.displayError != null ? "username can't empty": null,
            ),
          );
        });
  }
}