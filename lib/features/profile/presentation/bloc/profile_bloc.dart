import 'package:flutter_assignment/features/profile/domain/usecases/get_user.dart';
import 'package:flutter_assignment/features/profile/domain/usecases/get_user_preferences.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileBloc extends Bloc<ProfileEvent,ProfileState> {
  final GetUserPreferencesUseCase _getUserPreferencesUseCase;
  final GetUserUseCase _getUserUseCase;

  ProfileBloc(this._getUserPreferencesUseCase, this._getUserUseCase) : super(const ProfileLoading()){
    on <GetUser> (getUserInfo);
  }

  void getUserInfo(GetUser event,Emitter<ProfileState> emit) async {
    print("inside_getUserInfo");
    final userPreference = await _getUserPreferencesUseCase();
    final user = await _getUserUseCase();
    emit(ProfileLoaded(userPreference, user));
  }
}