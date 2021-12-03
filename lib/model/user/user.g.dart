// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..attempt_id = json['attempt_id'] as String?
  ..authentication_method = json['authentication_method'] as String?
  ..email = json['email'] as String?
  ..customer_exists = json['customer_exists'] as bool?
  ..token = json['token'] as String?
  ..phone = json['phone'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'attempt_id': instance.attempt_id,
      'authentication_method': instance.authentication_method,
      'email': instance.email,
      'customer_exists': instance.customer_exists,
      'token': instance.token,
      'phone': instance.phone,
    };
