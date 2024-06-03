import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_button.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:flutter_assignment/features/signup/presentation/widgets/name_input.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: const Column(
        children: [
          NameInput(),
          SizedBox(height: Dimensions.paddingSizeDefault,),
          _UserNameInput(),
          SizedBox(height: Dimensions.paddingSizeDefault,),
          _PasswordInput(),
          SizedBox(height: Dimensions.paddingSizeDefault,),
          _ConfirmPasswordInput(),

          SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
          _SignUpButton(),
          SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
        ],
      ),
    );
  }
}


class _UserNameInput extends StatelessWidget {
  const _UserNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
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
              inputType: TextInputType.emailAddress,
              onChanged: (username) => context.read<SignUpBloc>().add(SignUpUsernameChanged(username)),

              onValidate: (String? value){
              },
            ),
          );
        });
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state){
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: Theme.of(context).cardColor.withOpacity(.5)),
                borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
                boxShadow: [BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.10),
                )]
            ),
            child: CustomTextField(
              prefixIcon: Image.asset(Images.password,scale: 3,),
              title: AppConstants.password,
              hintText: AppConstants.password,
              isAutoFocus: true,
              isPassword: true,
              capitalization: TextCapitalization.words,
              onChanged: (password) => context.read<SignUpBloc>().add(SignUpPasswordChanged(password)),
              onValidate: (String? value){
              },
            ),
          );
      }
    );
  }
}


class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state){
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: Theme.of(context).cardColor.withOpacity(.5)),
                borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
                boxShadow: [BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.10),
                )]
            ),
            child: CustomTextField(
              prefixIcon: Image.asset(Images.password,scale: 3,),
              title: AppConstants.confirmPassword,
              hintText: AppConstants.confirmPassword,
              isAutoFocus: true,
              isPassword: true,
              capitalization: TextCapitalization.words,
              onChanged: (password) => context.read<SignUpBloc>().add(SignUpPasswordChanged(password)),
              onValidate: (String? value){
              },
            ),
          );
      }
    );
  }
}


class _SignUpButton extends StatelessWidget {
  const _SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state){
      return state.status.isInProgress
      ? const CircularProgressIndicator() : CustomButton(
        height: 60.0,
        onPressed: state.isValid ? () {
          context.read<SignUpBloc>().add(const SignUpSubmitted());
        } : null,
        buttonText: AppConstants.signUp,);
    });
  }
}

