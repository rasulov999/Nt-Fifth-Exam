class CustomerSatellitesModel {
  CustomerSatellitesModel({
    required this.id,
    required this.country,
    required this.launchTime,
    required this.mass,
    required this.launcher,
  });
  final String id;
  final String country;
  final String launchTime;
  final String mass;
  final String launcher;

  factory CustomerSatellitesModel.fromJson(Map<String, dynamic> json) {
    return CustomerSatellitesModel(
      id: json['id'] as String? ?? "",
      country: json['country'] as String? ?? "",
      launchTime: json['launch_date'] as String? ?? "",
      mass: json['mass'] as String? ?? "",
      launcher: json['launcher'] as String? ?? "",
    );
  }
}
