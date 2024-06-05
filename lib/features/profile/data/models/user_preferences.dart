import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences.freezed.dart';
part 'user_preferences.g.dart';

@freezed
class UserPreferences with _$UserPreferences {

  const factory UserPreferences({
    @JsonKey(name: 'token') String? token,
    @JsonKey(name: 'user_email') String? userEmail,
    @JsonKey(name: 'user_nicename') String? userNicename,
    @JsonKey(name: 'user_display_name') String? userDisplayName,
}) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);

}