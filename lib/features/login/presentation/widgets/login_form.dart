import 'package:flutter/material.dart';
import 'package:flutter_assignment/app.dart';
import 'package:flutter_assignment/core/widgets/custom_button.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class _UserNameInput extends StatelessWidget {
  const _UserNameInput({super.key});

  @override
  Widget build(BuildContext context) {
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
        onValidate: (String? value){
        },
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
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
        onValidate: (String? value){
        },
      ),
    );
  }
}


class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 60.0,
      onPressed: (){
        },
      buttonText: AppConstants.login,);
  }
}

