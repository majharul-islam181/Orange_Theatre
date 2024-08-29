class AppUrl {
  static String baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = "a07cd01daacf6d442859ea265542f754";
  static String popularMoviesList = '$baseUrl/movie/popular?api_key=$_apiKey';
}
