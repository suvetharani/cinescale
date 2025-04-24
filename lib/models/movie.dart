class Movie {
  final String title;
  final String year;
  final double rating;
  final String imagePath;
  final String? rated;
  final String? country;
  final String? runtime;
  final String? description;

  Movie({
    required this.title,
    required this.year,
    required this.rating,
    required this.imagePath,
    this.rated,
    this.country,
    this.runtime,
    this.description,
  });
}
