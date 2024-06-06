import 'package:flutter/material.dart';
import 'package:flutter_assignment/config/routes/route_name.dart';
import 'package:flutter_assignment/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:flutter_assignment/features/signup/presentation/widgets/signup_form.dart';
import 'package:flutter_assignment/injection_container.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_social_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context)
    );
  }

  _buildBody(context){
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: BlocProvider(
            create: (_) => sl<SignUpBloc>(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: Dimensions.paddingSizeDefault,),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 122,
                        width: 122,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                            boxShadow: [BoxShadow(
                              offset: const Offset(0, 3),
                              blurRadius: 6,
                              color: Colors.black.withOpacity(0.10),
                            )]
                        ),
                        child: Image.asset(Images.name,scale: 3,),
                      ),
                      Image.asset(Images.camera,scale: 3,)
                    ],
                  ),
                  const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge + 10,),
                  const SignUpForm(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppConstants.createNewAccount,style: robotoLight.copyWith(fontSize: Dimensions.fontSizeLarge),),
                      TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, RouteName.signinPage);
                          },
                          child: Text(AppConstants.login,style: robotoBold.copyWith(fontSize: Dimensions.fontSizeLarge),)),
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
