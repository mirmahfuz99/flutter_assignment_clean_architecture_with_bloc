import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:flutter_assignment/features/edit_profile/data/models/first_name.dart';
import 'package:flutter_assignment/features/edit_profile/data/models/last_name.dart';
import 'package:formz/formz.dart';
import 'package:bloc/bloc.dart';
part 'edit_profile_state.dart';
part 'edit_profile_event.dart';


class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc({
    required AuthenticationRepositoryImpl authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const EditProfileState()) {
    on<EditProfileFirstNameChanged>(_onFirstNameChanged);
    on<EditProfileLastNameChanged>(_onLastNameChanged);
    on<EditProfileSubmitted>(_onSubmitted);
  }

  final AuthenticationRepositoryImpl _authenticationRepository;

  void _onFirstNameChanged(
      EditProfileFirstNameChanged event,
      Emitter<EditProfileState> emit,
      ) {
    final firstName = FirstName.dirty(event.firstName);
    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([state.lastName, firstName]),
      ),
    );
  }
  void _onLastNameChanged(
      EditProfileLastNameChanged event,
      Emitter<EditProfileState> emit,
      ) {
    // print("works");
    final lastName = LastName.dirty(event.lastName);
    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate([state.firstName, lastName]),
      ),
    );
  }

  Future<void> _onSubmitted(
      EditProfileSubmitted event,
      Emitter<EditProfileState> emit,
      ) async {

    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        // print(state.firstName.value);
        // print(state.lastName.value);
        await _authenticationRepository.updateProfile(firstName: state.firstName.value, lastName: state.lastName.value);

        await Future.delayed(const Duration(seconds: 1), (){
          emit(state.copyWith(status: FormzSubmissionStatus.success));
        });


      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}