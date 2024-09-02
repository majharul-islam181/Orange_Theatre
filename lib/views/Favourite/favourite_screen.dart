import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/models/favourite/favourite_model_hive.dart';

import '../views.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: GoogleFonts.poppins(fontSize: 19, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ValueListenableBuilder<Box<FavouriteModelHive>>(
        valueListenable:
            Hive.box<FavouriteModelHive>('favouritesBox').listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<FavouriteModelHive>();
          if (data.isEmpty) {
            return const Center(
              child: Text('No favourites added yet'),
            );
          }
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieScreen(
                            movieId: data[index].id,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        height: MediaQuery.of(context).size.height * .15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              AppUrl.imageBaseUrl +
                                  data[index].backdropPath.toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    data[index].originalTitle.toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    data[index].releaseDate.toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                _delete(context, data[index]);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  void _delete(BuildContext context, FavouriteModelHive favourite) {
    final box = Hive.box<FavouriteModelHive>('favouritesBox');
    box.delete(favourite.key);
  }
}
