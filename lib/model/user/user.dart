import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? attempt_id;
  String? authentication_method;
  String? email;
  bool? customer_exists;
  String? token;
  String? phone;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static const fromJsonFactory = _$UserFromJson;

  User();

  @override
  String toString() {
    return 'User{attempt_id: $attempt_id, authentication_method: $authentication_method, email: $email, customer_exists: $customer_exists, token: $token,phone: $phone}';
  }
}
