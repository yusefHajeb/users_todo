import 'package:collection/collection.dart';

import '../../../domain/entites/user_entity.dart';
import 'address.dart';
import 'company.dart';

// ignore: must_be_immutable
class UsersModel extends Users {
  UsersModel({
    int? id,
    String? name,
    String? username,
    String? email,
    AddressModel? address,
    String? phone,
    String? website,
    CompanyModel? company,
  }) : super(
            id: id,
            name: name,
            username: username,
            email: email,
            address: address,
            phone: phone,
            website: website,
            company: company);

  factory UsersModel.fromMap(Map<String, dynamic> data) => UsersModel(
        id: data['id'],
        name: data['name'],
        username: data['username'],
        email: data['email'],
        address: data['address'] == null
            ? null
            : AddressModel.fromMap(data['address'] as Map<String, dynamic>),
        phone: data['phone'] as String?,
        website: data['website'] as String?,
        company: data['company'] == null
            ? null
            : CompanyModel.fromMap(data['company']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address?.toMap(),
        'phone': phone,
        'website': website,
        'company': company?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UsersModel].
  factory UsersModel.fromJson(Map<String, dynamic> data) {
    // return UsersModel.fromMap(json);
    return UsersModel.fromMap(data);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address?.toMap(),
      'phone': phone,
      'website': website,
      'company': company?.toMap(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UsersModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      website.hashCode ^
      company.hashCode;
}
