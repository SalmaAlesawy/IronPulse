class TrainersModel {
  final String image;
  final String name;
  final String specialty;
  final int experienceYears;
  final double rating;
  final int clients;

  const TrainersModel({
    required this.image,
    required this.name,
    required this.specialty,
    required this.experienceYears,
    required this.rating,
    this.clients = 0,
  });

  factory TrainersModel.fromJson(Map<String, dynamic> json) {
    return TrainersModel(
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      specialty: json['specialty'] ?? '',
      experienceYears: json['experienceYears'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      clients: json['clients'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'specialty': specialty,
      'experienceYears': experienceYears,
      'rating': rating,
      'clients': clients,
    };
  }
}
