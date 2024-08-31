class AppUrl {
  static String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String _apiKey = "a07cd01daacf6d442859ea265542f754";
  static String popularMoviesList = '$baseUrl/popular?api_key=$_apiKey';
  static String upComingMoviesList = '$baseUrl/upcoming?api_key=$_apiKey';
  static String productScreen = '$baseUrl/{movieId}?api_key=$_apiKey';
  static String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static String genreList = '$baseUrl/list/?api_key=$_apiKey';
}
