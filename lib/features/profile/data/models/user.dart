import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {

  const factory User({
    @JsonKey(name: 'user_email') String? userEmail,
    @JsonKey(name: 'user_nicename') String? userNicename,
    @JsonKey(name: 'user_display_name') String? userDisplayName,
}) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

}