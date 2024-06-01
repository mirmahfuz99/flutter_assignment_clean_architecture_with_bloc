import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_button.dart';
import 'package:flutter_assignment/core/widgets/custom_text_field.dart';
import 'package:flutter_assignment/features/login/presentation/widgets/login_form.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';

import '../../../../core/widgets/custom_social_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.logo,scale: 3,),
                const SizedBox(height: 80.0,),
                Text(AppConstants.signIn,style: robotoBold.copyWith(fontSize: Dimensions.fontSizeOverLarge),),
                const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
                const LoginForm(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialButton(iconPath: Images.facebook,),
                    const SizedBox(width: Dimensions.paddingSizeDefault,),
                    CustomSocialButton(iconPath: Images.google,)
                  ],
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
                Text(AppConstants.createNewAccount,style: robotoLight.copyWith(fontSize: Dimensions.fontSizeLarge),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
