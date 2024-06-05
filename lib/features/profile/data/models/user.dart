import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {

  const factory User({
    @JsonKey(name: 'username') String? userName,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'nickname') String? userNicename,
}) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

}