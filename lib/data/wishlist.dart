import '../models/movie.dart';

class Wishlist {
  static final List<Movie> _wishlistMovies = [];

  static List<Movie> get movies => _wishlistMovies;

  static void add(Movie movie) {
    if (!_wishlistMovies.contains(movie)) {
      _wishlistMovies.add(movie);
    }
  }

  static void remove(Movie movie) {
    _wishlistMovies.remove(movie);
  }

  static bool isInWishlist(Movie movie) {
    return _wishlistMovies.contains(movie);
  }

  static void clear() {
    _wishlistMovies.clear();
  }
}
