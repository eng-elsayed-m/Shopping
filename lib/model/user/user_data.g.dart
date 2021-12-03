// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData()
  ..id = json['id'] as int?
  ..first_name = json['first_name'] as String?
  ..last_name = json['last_name'] as String?
  ..email = json['email'] as String?
  ..phone = json['phone'] as String?;

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone': instance.phone,
    };
