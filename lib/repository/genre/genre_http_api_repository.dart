import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/models/genre_model/genres_model.dart';
import 'package:orange_theatre/repository/genre/genre_repository.dart';
import '../../data/network/network_services_api.dart';

class GenreHttpApiRepository extends GenreRepository {
  final _apiServices = NetworkServicesApi();

  @override
  Future<GenresModel> fetchGenre() async {
    final String endpoint = AppUrl.genreList;
    final response = await _apiServices.getApi(endpoint);
    return GenresModel.fromJson(response);
  }
}
