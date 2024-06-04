part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

final class EditProfileFirstNameChanged extends EditProfileEvent {
  const EditProfileFirstNameChanged(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

final class EditProfileLastNameChanged extends EditProfileEvent {
  const EditProfileLastNameChanged(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

final class EditProfileSubmitted extends EditProfileEvent {
  const EditProfileSubmitted();
}