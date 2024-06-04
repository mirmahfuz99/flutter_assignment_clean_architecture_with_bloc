import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:flutter_assignment/features/login/data/models/password.dart';
import 'package:flutter_assignment/features/login/data/models/username.dart';
import 'package:flutter_assignment/features/signup/data/models/name.dart';
import 'package:formz/formz.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthenticationRepositoryImpl authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const SignUpState()) {
    on<SignUpNameChanged>(_onNameChanged);
    on<SignUpUsernameChanged>(_onUsernameChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignUpSubmitted>(_onSubmitted);
  }

  final AuthenticationRepositoryImpl _authenticationRepository;

  void _onNameChanged(
      SignUpNameChanged event,
      Emitter<SignUpState> emit,
      ) {
    print("works");
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([state.password, name]),
      ),
    );
  }
  void _onUsernameChanged(
      SignUpUsernameChanged event,
      Emitter<SignUpState> emit,
      ) {
    print("works");
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([state.password, username]),
      ),
    );
  }

  void _onPasswordChanged(
      SignUpPasswordChanged event,
      Emitter<SignUpState> emit,
      ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }
  void _onConfirmPasswordChanged(
      SignUpConfirmPasswordChanged event,
      Emitter<SignUpState> emit,
      ) {
    final confirmPassword = Password.dirty(event.confirmPassword);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate([confirmPassword, state.username]),
      ),
    );
  }

  Future<void> _onSubmitted(
      SignUpSubmitted event,
      Emitter<SignUpState> emit,
      ) async {

    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        if(state.password.value == state.confirmPassword.value){
          await _authenticationRepository.signUp(
            name: state.username.value,
            email: state.username.value,
            password: state.password.value,
            confirmPassword: state.password.value,
          );
          emit(state.copyWith(status: FormzSubmissionStatus.success));

        }else{
          print("password_and_confirm_password_not_matched");
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}