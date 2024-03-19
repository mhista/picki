import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pickafrika/utils/formatters/formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;
  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => PFormatter.formatPhoneNumber(phoneNumber);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'street': street});
    result.addAll({'city': city});
    result.addAll({'state': state});
    result.addAll({'postalCode': postalCode});
    result.addAll({'country': country});
    if (dateTime != null) {
      result.addAll({'dateTime': dateTime!.millisecondsSinceEpoch});
    }
    result.addAll({'selectedAddress': selectedAddress});

    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      street: map['street'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      postalCode: map['postalCode'] ?? '',
      country: map['country'] ?? '',
      dateTime: map['dateTime'] != null
          ? (map['dateTime'] as Timestamp).toDate()
          : null,
      selectedAddress: map['selectedAddress'] ?? false,
    );
  }
  // EMPTY MODEL
  static AddressModel empty() => AddressModel(
      id: '',
      name: '',
      phoneNumber: '',
      street: '',
      city: '',
      state: '',
      postalCode: '',
      country: '');
// FETCH USERS USING SNAPSHOT
  factory AddressModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final map = documentSnapshot.data()!;
    return AddressModel(
      id: documentSnapshot.id,
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      street: map['street'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      postalCode: map['postalCode'] ?? '',
      country: map['country'] ?? '',
      dateTime: map['dateTime'] != null
          ? (map['dateTime'] as Timestamp).toDate()
          : null,
      selectedAddress: map['selectedAddress'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '$street, $city, $state $postalCode, $country';
  }
}
