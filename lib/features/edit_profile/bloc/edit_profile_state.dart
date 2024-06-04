part of 'edit_profile_bloc.dart';

final class EditProfileState extends Equatable {
  const EditProfileState({
    this.status = FormzSubmissionStatus.initial,
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final FirstName firstName;
  final LastName lastName;
  final bool isValid;

  EditProfileState copyWith({
    FormzSubmissionStatus? status,
    FirstName? firstName,
    LastName? lastName,
    bool? isValid,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, firstName, lastName];
}