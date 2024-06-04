import 'package:flutter_assignment/features/profile/domain/usecases/get_user.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileBloc extends Bloc<ProfileEvent,ProfileState> {
  final GetUserUseCase _getUserUseCase;

  ProfileBloc(this._getUserUseCase) : super(const ProfileLoading()){
    on <GetUser> (onGetMedicineGenericCompany);
  }

  void onGetMedicineGenericCompany(GetUser event,Emitter<ProfileState> emit) async {
    final user = await _getUserUseCase();
    emit(ProfileLoaded(user));
  }
}