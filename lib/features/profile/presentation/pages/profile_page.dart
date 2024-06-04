import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_assignment/injection_container.dart';
import 'package:flutter_assignment/utils/app_constants.dart';
import 'package:flutter_assignment/utils/dimensions.dart';
import 'package:flutter_assignment/utils/images.dart';
import 'package:flutter_assignment/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            return Column(
              children: [
                const SizedBox(height: Dimensions.paddingSizeExtraLarge,),
                const Text(AppConstants.myAccount, style: robotoBold,),
                const SizedBox(height: Dimensions.paddingSizeDefault,),
                Image.asset(Images.profileDummyImage, scale: 3,)
              ],
            );
          }
          return const SizedBox();
        }
    );
  }
}
