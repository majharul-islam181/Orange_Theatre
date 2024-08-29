import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/data/network/network_services_api.dart';
import 'package:orange_theatre/models/product_model/product_model.dart';
import 'package:orange_theatre/repository/product/product_repository.dart';

class ProductHttpApiRepository extends ProductRepository {
  final _apiServices = NetworkServicesApi();


@override
Future<ProductModel> fetchProductDetails(int movieId) async {
  // Construct the endpoint with the movieId
  final String endpoint = AppUrl.productScreen.replaceFirst('{movieId}', movieId.toString());
  
  final response = await _apiServices.getApi(endpoint);

  // Convert the response into the ProductModel
  return ProductModel.fromJson(response);
}
}

 