import 'package:equatable/equatable.dart';

import '../../data/models/users/address.dart';
import '../../data/models/users/company.dart';
import '../../data/models/users/geo.dart';

class Users extends Equatable {
  int? id;
  String? name;
  String? username;
  String? email;
  AddressModel? address;
  String? phone;
  String? website;
  CompanyModel? company;

  Users({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];
}

class Address extends Equatable {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoModel? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  @override
  // TODO: implement props
  List<Object?> get props => [street, suite, city, zipcode, geo];
}

class Company extends Equatable {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  @override
  // TODO: implement props
  List<Object?> get props => [name, catchPhrase, bs];
}

class Geo extends Equatable {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  @override
  // TODO: implement props
  List<Object?> get props => [lat, lng];
}
