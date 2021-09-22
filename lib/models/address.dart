import 'dart:convert';

class Address {
  String placeFormattedAddress;
  String placeName;
  String placeId;
  double latitude;
  double longitude;
  Address({
    required this.placeFormattedAddress,
    required this.placeName,
    required this.placeId,
    required this.latitude,
    required this.longitude,
  });

  // Address({
  //   required this.placeFormattedAddress, this.placeName, this.PlaceId, this.latitude, this.longitude
  // });

//   Address copyWith({
//     String? placeFormattedAddress,
//     String? placeName,
//     String? placeId,
//     double? latitude,
//     double? longitude,
//   }) {
//     return Address(
//       placeFormattedAddress: placeFormattedAddress ?? this.placeFormattedAddress,
//       placeName: placeName ?? this.placeName,
//       placeId: placeId ?? this.placeId,
//       latitude: latitude ?? this.latitude,
//       longitude: longitude ?? this.longitude,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'placeFormattedAddress': placeFormattedAddress,
//       'placeName': placeName,
//       'placeId': placeId,
//       'latitude': latitude,
//       'longitude': longitude,
//     };
//   }

//   factory Address.fromMap(Map<String, dynamic> map) {
//     return Address(
//       placeFormattedAddress: map['placeFormattedAddress'],
//       placeName: map['placeName'],
//       placeId: map['placeId'],
//       latitude: map['latitude'],
//       longitude: map['longitude'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Address.fromJson(String source) => Address.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Address(placeFormattedAddress: $placeFormattedAddress, placeName: $placeName, placeId: $placeId, latitude: $latitude, longitude: $longitude)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
  
//     return other is Address &&
//       other.placeFormattedAddress == placeFormattedAddress &&
//       other.placeName == placeName &&
//       other.placeId == placeId &&
//       other.latitude == latitude &&
//       other.longitude == longitude;
//   }

//   @override
//   int get hashCode {
//     return placeFormattedAddress.hashCode ^
//       placeName.hashCode ^
//       placeId.hashCode ^
//       latitude.hashCode ^
//       longitude.hashCode;
//   }
}
