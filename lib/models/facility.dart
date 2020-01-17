class Facility {
  Facility({
    this.id,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  final int id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
}
