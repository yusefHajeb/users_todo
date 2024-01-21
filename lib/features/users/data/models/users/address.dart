import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';

import 'geo.dart';

// ignore: must_be_immutable
class AddressModel extends Address {
//  final  String? street;
//  final String? suite;
//  final String? city;
//  final String? zipcode;
//  final GeoModel? geo;

  AddressModel(
      {String? street,
      String? suite,
      String? city,
      String? zipcode,
      GeoModel? geo})
      : super(
            street: street,
            city: city,
            zipcode: zipcode,
            suite: suite,
            geo: geo);

  factory AddressModel.fromMap(Map<String, dynamic> data) => AddressModel(
        street: data['street'],
        suite: data['suite'],
        city: data['city'],
        zipcode: data['zipcode'],
        geo: data['geo'] == null
            ? null
            : GeoModel.fromMap(data['geo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddressModel].
  factory AddressModel.fromJson(Map<String, dynamic> data) {
    return AddressModel.fromMap(data);
  }

  // factory AddressModel.fromJson(Map<String, dynamic> data) {
  //   return AddressModel(
  //     street: data['street'],
  //     suite: data['suite'],
  //     city: data['city'],
  //     zipcode: data['zipcode'],
  //     geo: data['geo'] == null
  //         ? null
  //         : GeoModel.fromMap(data['geo'] as Map<String, dynamic>),
  //   );
  // }

  /// `dart:convert`
  ///
  /// Converts [AddressModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AddressModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      street.hashCode ^
      suite.hashCode ^
      city.hashCode ^
      zipcode.hashCode ^
      geo.hashCode;
}
