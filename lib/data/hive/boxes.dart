import 'package:hive_flutter/hive_flutter.dart';
import 'package:orange_theatre/models/favourite/favourite_model_hive.dart';

class Boxes {
  static Box<FavouriteModelHive> getData() => Hive.box<FavouriteModelHive>('favouritesBox');
}