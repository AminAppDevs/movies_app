class AppConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'c2bf0ac68fd1291ae2478cfb769d09b4';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl (String imagePath) => '$baseImageUrl$imagePath';
}
