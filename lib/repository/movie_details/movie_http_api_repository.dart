import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/data/network/network_services_api.dart';
import 'package:orange_theatre/models/movie_model/movie_model.dart';
import 'package:orange_theatre/repository/movie_details/movie_repository.dart';

class MovieHttpApiRepository extends MovieRepository {
  final _apiServices = NetworkServicesApi();

@override
Future<MovieModel> fetchMovieDetails(int movieId) async {
  final String endpoint = AppUrl.productScreen.replaceFirst('{movieId}', movieId.toString());
  final response = await _apiServices.getApi(endpoint);
  return MovieModel.fromJson(response);
}
}

 