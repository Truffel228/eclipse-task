import 'package:eclipse_task/models/address/address.dart';
import 'package:eclipse_task/models/company/company.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_api.g.dart';

/// Модель которую получаем с API которую в последствии будем парсить в entity
@JsonSerializable()
class UserApi {
  UserApi({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
    required this.address,
  });

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Company company;
  final Address address;

  factory UserApi.fromJson(Map<String, dynamic> json) =>
      _$UserApiFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiToJson(this);
}
