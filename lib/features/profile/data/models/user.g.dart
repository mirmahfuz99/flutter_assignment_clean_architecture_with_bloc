// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userEmail: json['user_email'] as String?,
      userNicename: json['user_nicename'] as String?,
      userDisplayName: json['user_display_name'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'user_email': instance.userEmail,
      'user_nicename': instance.userNicename,
      'user_display_name': instance.userDisplayName,
    };
