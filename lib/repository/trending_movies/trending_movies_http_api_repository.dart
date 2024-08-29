import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/data/network/network_services_api.dart';
import 'package:orange_theatre/models/trending_movies/trending_movies_model.dart';
import 'package:orange_theatre/repository/trending_movies/trending_movies_repository.dart';

class TrendingMoviesHttpApiRepository extends TrendingMoviesRepository {
  final _apiServices = NetworkServicesApi();

  @override
  Future<TrendingMoviesModel> fetchTrendingMoviesList() async {
    final String endpoint = AppUrl.popularMoviesList;
    final response = await _apiServices.getApi(endpoint);

    return TrendingMoviesModel.fromJson(response);
  }
}
