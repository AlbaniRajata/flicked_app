import 'movie.dart';
import 'search_category.dart';

class MainPageData {
  final List<Movie>? movies;
  final int? page;
  final String? searchText;
  final String? searchCategory;

  MainPageData({
    required this.movies,
    required this.page,
    required this.searchText,
    required this.searchCategory,
  });

  factory MainPageData.inital() {
    return MainPageData(
      movies: [],
      page: 1,
      searchText: '',
      searchCategory: SearchCategory.popular,
    );
  }

  MainPageData copyWith({
    List<Movie>? movies,
    int? page,
    String? searchText,
    String? searchCategory,
  }) {
    return MainPageData(
      movies: movies ?? this.movies,
      page: page ?? this.page,
      searchText: searchText ?? this.searchText,
      searchCategory: searchCategory ?? this.searchCategory,
    );
  }
}
