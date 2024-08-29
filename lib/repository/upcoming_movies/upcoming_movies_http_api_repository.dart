import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/data/network/network_services_api.dart';
import 'package:orange_theatre/models/upcoming_movies/upcoming_movies_model.dart';
import 'package:orange_theatre/repository/upcoming_movies/upcoming_movies_repository.dart';

class UpcomingMoviesHttpApiRepository extends UpcomingMoviesRepository {
  final _apiServices = NetworkServicesApi();

  @override
  Future<UpcomingMoviesModel> fetchUpcomingMoviesList() async{
    final String endpoint = AppUrl.upComingMoviesList;
    final response = await _apiServices.getApi(endpoint);

    return UpcomingMoviesModel.fromJson(response);
  }
}
