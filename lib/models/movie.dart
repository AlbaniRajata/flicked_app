//Packages
import 'package:get_it/get_it.dart';

//Models
import '../models/app_config.dart';

class Movie {
  final String? name;
  final String? language;
  final bool? isAdult;
  final String? description;
  final String? posterPath;
  final String? backdropPath;
  final num? rating;
  final String? releaseDate;

  Movie({
    required this.name,
    required this.language,
    required this.isAdult,
    required this.description,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['title'] ?? 'Unknown',
      language: json['original_language'] ?? 'Unknown',
      isAdult: json['adult'] ?? false,
      description: json['overview'] ?? 'No description available',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      rating: json['vote_average'] ?? 0.0,
      releaseDate: json['release_date'] ?? 'Unknown',
    );
  }

  String posterURL() {
    final AppConfig appConfig = GetIt.instance.get<AppConfig>();
    if (posterPath == null || posterPath!.isEmpty) {
      return 'https://via.placeholder.com/300x450?text=No+Image'; // Gambar default
    }
    return '${appConfig.BASE_IMAGE_API_URL}$posterPath';
  }

  String backdropURL() {
    final AppConfig appConfig = GetIt.instance.get<AppConfig>();
    if (backdropPath == null || backdropPath!.isEmpty) {
      return 'https://via.placeholder.com/1280x720?text=No+Backdrop'; // Gambar default
    }
    return '${appConfig.BASE_IMAGE_API_URL}$backdropPath';
  }

}