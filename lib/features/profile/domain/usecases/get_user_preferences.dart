import 'package:flutter_assignment/core/usecase/usecase.dart';
import 'package:flutter_assignment/features/profile/data/models/user_preferences.dart';
import 'package:flutter_assignment/features/profile/domain/repository/user_repo.dart';

class GetUserPreferencesUseCase implements UseCase<UserPreferences, void>{

  final UserRepository _repository;

  GetUserPreferencesUseCase(this._repository);

  @override
  Future<UserPreferences> call({void params}) {
    return _repository.getUserPreferences();
  }

}