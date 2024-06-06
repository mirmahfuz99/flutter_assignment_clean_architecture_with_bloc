import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_assignment/features/login/presentation/widgets/login_button.dart';
import 'package:flutter_assignment/features/login/presentation/widgets/password_input.dart';
import 'package:flutter_assignment/features/login/presentation/widgets/username_input.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Column(
        children: [
          const UserNameInput(),
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          const PasswordInput(),
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          Align(
            alignment: Alignment.centerRight,
            child: Text(AppConstants.forgotPassword,
              style: robotoRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5)
              ),
            ),
          ),
          const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
          const LoginButton(),
          const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
        ],
      ),
    );
  }
}
