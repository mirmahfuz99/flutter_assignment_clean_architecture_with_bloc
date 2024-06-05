// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      token: json['token'] as String?,
      userEmail: json['user_email'] as String?,
      userNicename: json['user_nicename'] as String?,
      userDisplayName: json['user_display_name'] as String?,
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user_email': instance.userEmail,
      'user_nicename': instance.userNicename,
      'user_display_name': instance.userDisplayName,
    };
