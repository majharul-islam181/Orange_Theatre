import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/data/network/network_services_api.dart';
import 'package:orange_theatre/models/movie_model/movie_model.dart';
import 'package:orange_theatre/repository/movie_details/movie_repository.dart';

class MovieHttpApiRepository extends MovieRepository {
  final _apiServices = NetworkServicesApi();
  final Map<int, MovieModel> _cache = {};

  @override
  Future<MovieModel> fetchMovieDetails(int movieId) async {
    final String endpoint =
        AppUrl.productScreen.replaceFirst('{movieId}', movieId.toString());

    // Check if movie details are already cached
    if (_cache.containsKey(movieId)) {
      // Return the cached movie details
      return _cache[movieId]!;
    }

    // Fetch from API if not cached
    final response = await _apiServices.getApi(endpoint);

    // Cache the fetched movie details
    final movieDetails = MovieModel.fromJson(response);
    _cache[movieId] = movieDetails;

    return movieDetails;
  }
}
