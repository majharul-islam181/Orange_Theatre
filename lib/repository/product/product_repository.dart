
import 'package:orange_theatre/models/product_model/product_model.dart';

abstract class ProductRepository {
  Future<ProductModel> fetchProductDetails(int movieId);
}