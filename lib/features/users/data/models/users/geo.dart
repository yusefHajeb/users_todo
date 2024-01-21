import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';

// ignore: must_be_immutable
class GeoModel extends Geo {
  GeoModel({String? lat, String? lng}) : super(lat: lat, lng: lng);

  factory GeoModel.fromMap(Map<String, dynamic> data) => GeoModel(
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'lat': lat,
        'lng': lng,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Geo].
  factory GeoModel.fromJson(String data) {
    return GeoModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GeoModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GeoModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
