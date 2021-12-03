import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  int? id;
  String? first_name;
  String? last_name;
  String? email;
  String? phone;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  static const fromJsonFactory = _$UserDataFromJson;

  UserData();

  @override
  String toString() {
    return 'UserData{id: $id, first_name: $first_name, last_name: $last_name, email: $email, phone: $phone}';
  }
}
