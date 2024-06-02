import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_button.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {

      },
      child: Column(
        children: [
          const _UserNameInput(),
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          const _PasswordInput(),
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
          const _LoginButton(),
          const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
        ],
      ),
    );
  }
}

class _UserNameInput extends StatelessWidget {
  const _UserNameInput({super.key});

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
    return BlocBuilder<LoginBloc, LoginState>(
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
              capitalization: TextCapitalization.words,
              onChanged: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              onValidate: (String? value){
              },
            ),
          );
      }
    );
  }
}


class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state){
      return state.status.isInProgress
      ? const CircularProgressIndicator() : CustomButton(
        height: 60.0,
        onPressed: (){
          state.isValid ? () {
            context.read<LoginBloc>().add(const LoginSubmitted());
          } : null;
        },
        buttonText: AppConstants.login,);
    });
  }
}

