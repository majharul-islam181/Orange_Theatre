import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/data/network/network_services_api.dart';
import 'package:orange_theatre/models/product_model/movie_model.dart';
import 'package:orange_theatre/repository/movie/movie_repository.dart';

class ProductHttpApiRepository extends ProductRepository {
  final _apiServices = NetworkServicesApi();


@override
Future<MovieModel> fetchProductDetails(int movieId) async {
  // Construct the endpoint with the movieId
  final String endpoint = AppUrl.productScreen.replaceFirst('{movieId}', movieId.toString());
  
  final response = await _apiServices.getApi(endpoint);

  // Convert the response into the MovieModel
  return MovieModel.fromJson(response);
}
}

 