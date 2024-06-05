import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/widgets/custom_button.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_assignment/features/profile/presentation/widgets/profile_account.dart';
import 'package:flutter_assignment/features/profile/presentation/widgets/profile_password.dart';
import 'package:flutter_assignment/features/profile/presentation/widgets/user_email.dart';
import 'package:flutter_assignment/injection_container.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool _isExpanded = false;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (_) => sl<ProfileBloc>()..add(const GetUser()),
        child: _buildBody()
      )
    );
  }

  _buildBody(){
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state){
          if(state is ProfileLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is ProfileLoaded){

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(
                  children: [
                    const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
                    Text(AppConstants.myAccount, style: robotoBold.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,
                    ),),
                    const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
                    DottedBorder(
                      dashPattern: const <double>[6, 3],
                        borderType: BorderType.Circle,
                        color: Theme.of(context).primaryColor.withOpacity(.5),
                        radius: const Radius.circular(Dimensions.radiusExtraLarge),
                        child: Padding(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                          child: Image.asset(Images.profileDummyImage, scale: 3,),
                        )),
                    const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
                    Text(state.userPreferences!.userDisplayName!, style: robotoBold.copyWith(
                      fontSize: Dimensions.fontSizeOverLarge,
                    ),),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                    Text(state.userPreferences!.userEmail!, style: robotoRegular.copyWith(
                      fontSize: Dimensions.fontSizeDefault,
                      color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5)
                    ),),
                    const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),

                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                          boxShadow: [BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 6,
                            color: Colors.black.withOpacity(0.10),
                          )],
                        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: Column(
                          children: [
                            ProfileAccountSection(user: state.user!,userPreferences: state.userPreferences!,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                              child: Divider(color: Theme.of(context).primaryColorLight.withOpacity(.3),),
                            ),

                            const ProfilePassword(),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                              child: Divider(
                                height: 2.0,
                                color: Theme.of(context).primaryColorLight.withOpacity(.3),),
                            ),
                            ExpansionTile(
                              trailing: trailing(),
                              enabled: false,
                              backgroundColor: Colors.transparent,
                              expandedCrossAxisAlignment: CrossAxisAlignment.start,
                              childrenPadding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                              title: Row(
                                children: [
                                  Image.asset(Images.notification,scale: 3,),
                                  const SizedBox(width: Dimensions.paddingSizeDefault,),
                                  Text(AppConstants.notification,style: robotoRegular.copyWith(
                                      color: Theme.of(context).textTheme.bodySmall!.color!,
                                      fontSize: Dimensions.fontSizeLarge
                                  ),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                              child: Divider(color: Theme.of(context).primaryColorLight.withOpacity(.3),),
                            ),
                            ExpansionTile(
                              enabled: false,
                              trailing: trailing(),
                              onExpansionChanged: (bool expanded) {
                                setState(() => _isExpanded = expanded);
                              },
                              backgroundColor: Colors.transparent,
                              expandedCrossAxisAlignment: CrossAxisAlignment.start,
                              childrenPadding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                              title: Row(
                                children: [
                                  Image.asset(Images.wishlist,scale: 3,),
                                  const SizedBox(width: Dimensions.paddingSizeDefault,),

                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(text: AppConstants.wishlist,style: robotoRegular.copyWith(
                                            fontSize: Dimensions.fontSizeLarge,
                                          color: Theme.of(context).textTheme.bodySmall!.color!,

                                        ),),
                                        TextSpan(
                                          text: '(00)',
                                          style: robotoRegular.copyWith(
                                            color: Theme.of(context).primaryColorLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              children: const [
                                Text("Not yet implemented",style: robotoRegular,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        }
    );
  }

  Widget trailing(){
    return _isExpanded ?
    RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: Theme.of(context).textTheme.bodySmall!.color!,
        )) :
    Icon(
      Icons.arrow_forward_ios,
      color: Theme.of(context).primaryColorLight,
      size: 12,);
  }
}
