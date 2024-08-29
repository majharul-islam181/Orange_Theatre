
import 'package:orange_theatre/models/product_model/movie_model.dart';

abstract class ProductRepository {
  Future<MovieModel> fetchProductDetails(int movieId);
}