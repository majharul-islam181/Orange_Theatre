import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_theatre/config/app_url.dart';

// Assuming you have a ProductionCompany class defined somewhere
class ProductionCompany {
  final String name;
  final String logoPath;

  ProductionCompany({required this.name, required this.logoPath});
}

class ProductionCompaniesWidget extends StatelessWidget {
  final List<ProductionCompany> companies;

  const ProductionCompaniesWidget({
    Key? key,
    required this.companies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Production Companies: ",
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: companies.length,
              itemBuilder: (context, index) {
                final company = companies[index];
                final logoUrl = company.logoPath.isNotEmpty
                    ? AppUrl.imageBaseUrl + company.logoPath
                    : null;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: logoUrl != null
                            ? NetworkImage(logoUrl)
                            : const AssetImage(
                                'assets/images/enterprise.png',
                              ) as ImageProvider,
                        radius: 20,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        company.name,
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
      ),
    );
  }
}
