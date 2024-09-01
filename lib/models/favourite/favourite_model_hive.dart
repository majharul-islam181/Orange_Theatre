import 'package:hive/hive.dart';

part 'favourite_model_hive.g.dart';

@HiveType(typeId: 0)
class FavouriteModelHive extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String originalTitle;

  @HiveField(2)
  final String backdropPath;

  @HiveField(3)
  final String releaseDate;



  FavouriteModelHive({
    required this.id,
    required this.originalTitle,
    required this.backdropPath,
    required this.releaseDate,

  });
}


//flutter packages pub run build_runner build
