import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_theatre/config/app_url.dart';
import 'package:orange_theatre/models/movie_model/movie_model.dart';

// class ProductionCompanywidget extends StatelessWidget {

//   final List<Map<String, dynamic>> companies; 
//   int? productionCompanyLength;
//   String? companyImageUrl;
//   String? companyName;
//   ProductionCompanywidget({
//     super.key,
//      required this.companies,
//     required this.productionCompanyLength,
//     required this.companyName,
//     required this.companyImageUrl,

//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Production Companies",
//             style:
//                 GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           SizedBox(
//               height: 100,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: productionCompanyLength,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Column(
//                         children: [
//                           CircleAvatar(
//                             backgroundImage: NetworkImage(AppUrl.imageBaseUrl +
//                                 companyImageUrl.toString()),
//                             radius: 25,
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             companies,
//                             style: GoogleFonts.poppins(
//                                 fontSize: 12, fontWeight: FontWeight.w300),
//                           ),
//                         ],
//                       ),
//                     );
//                   })),
//         ],
//       ),
//     );
//   }
// }

class ProductionCompanywidget extends StatelessWidget {
  final List<ProductionCompany> companies;

  const ProductionCompanywidget({Key? key, required this.companies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Production Countries",
          style: GoogleFonts.poppins(
              fontSize: 17, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: companies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(AppUrl.imageBaseUrl + companies[index].logoPath),
                      radius: 25,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      companies[index].name,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}



