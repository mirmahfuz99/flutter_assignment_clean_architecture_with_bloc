import 'package:flutter_assignment/core/usecase/usecase.dart';
import 'package:flutter_assignment/features/profile/data/models/user.dart';
import 'package:flutter_assignment/features/profile/domain/repository/user_repo.dart';

class GetUserUseCase implements UseCase<User, void>{

  final UserRepository _repository;

  GetUserUseCase(this._repository);

  @override
  Future<User> call({void params}) {
    return _repository.getUser();
  }

}