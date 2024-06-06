import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_button.dart';
import 'package:flutter_assignment/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state){
      return state.status.isInProgress
          ? const CircularProgressIndicator() : CustomButton(
        height: 60.0,
        onPressed: state.isValid ? () {
          context.read<LoginBloc>().add(const LoginSubmitted());
        } : null,
        buttonText: AppConstants.login,);
    });
  }
}