import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';

class CompanyModel extends Company {
  CompanyModel({String? name, String? catchPhrase, String? bs});

  factory CompanyModel.fromMap(Map<String, dynamic> data) => CompanyModel(
        name: data['name'] as String?,
        catchPhrase: data['catchPhrase'] as String?,
        bs: data['bs'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'catchPhrase': catchPhrase,
        'bs': bs,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Company].
  factory CompanyModel.fromJson(Map<String, dynamic> data) {
    return CompanyModel.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [Company] to a JSON string.
  String toJson() => json.encode(toMap());

  // @override
  // bool operator ==(Object other) {
  //   if (identical(other, this)) return true;
  //   if (other is! Company) return false;
  //   final mapEquals = const DeepCollectionEquality().equals;
  //   return mapEquals(other.toMap(), toMap());
  // }

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;
}
