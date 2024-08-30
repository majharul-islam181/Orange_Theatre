import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<String> imageUrls = [
    'url1',
    'url2',
    'url3',
    'url1',
    'url2',
    'url3',
    'url1',
    'url2',
    'url3',
    'url1',
    'url2',
    'url3',
    'url1',
    'url2',
    'url3',
  ]; // Replace with your image URLs
  List<String> names = [
    'Name1',
    'Name2',
    'Name3',
    'Name1',
    'Name2',
    'Name3',
    'Name1',
    'Name2',
    'Name3',
    'Name1',
    'Name2',
    'Name3',
    'Name1',
    'Name2',
    'Name3',
  ];

  List<Map<String, dynamic>> genre = [
    {"id": 28, "name": "Action"},
    {"id": 35, "name": "Comedy"},
    {"id": 878, "name": "Science Fiction"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60))),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                // color: Colors.blue[900],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(770),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(400),
                  bottomRight: Radius.circular(5),
                ),
                child: Image.network(
                  'https://th.bing.com/th/id/R.78ab058529b639453db95b7ed2a5011f?rik=q%2fJtTs0jpSGRpg&pid=ImgRaw&r=0',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * .22,
                left: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    'https://th.bing.com/th/id/R.b47abe620899296505b369ca1aea7539?rik=Vp2ncEwuYPT5%2fQ&riu=http%3a%2f%2fimages2.fanpop.com%2fimage%2fphotos%2f13000000%2fSpider-Man-spider-man-13062150-1280-1572.jpg&ehk=193u8f4xtMXTNRqmwccMThPn1irEykUWdkBqLse9oJU%3d&risl=&pid=ImgRaw&r=0',
                    height: 100,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * .3,
                right: 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/review.svg',
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '222',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )),
          ],
        ),

        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              'SpiderMan No Way Home',
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    Icons.new_releases,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Release Date',
                    style: GoogleFonts.poppins(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ecommerce-money-svgrepo-com.svg',
                    height: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Revenue',
                    style: GoogleFonts.poppins(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Image.asset(
                  'assets/icons/production_house.png',
                  height: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'US',
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w400),
                )
              ],
            )),
          ],
        ),

        const SizedBox(
          height: 10,
        ),

        //production companies
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Production Companies",
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            // CircleAvatar(
                            //   backgroundImage: NetworkImage(imageUrls[index]),
                            //   radius: 30,
                            // ),
                            const SizedBox(height: 8),
                            Text(
                              names[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ],
    ));
  }
}

// https://www.youtube.com/watch?v=pGhexqLeths

//https://th.bing.com/th/id/R.78ab058529b639453db95b7ed2a5011f?rik=q%2fJtTs0jpSGRpg&pid=ImgRaw&r=0
