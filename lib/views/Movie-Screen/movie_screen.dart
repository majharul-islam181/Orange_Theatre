import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
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
              height: MediaQuery.of(context).size.height * .35,
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
            // Positioned(
            //     top: MediaQuery.of(context).size.height * .3,
            //     left: 16,
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(40),
            //       child: Image.network(
            //         'https://th.bing.com/th/id/R.78ab058529b639453db95b7ed2a5011f?rik=q%2fJtTs0jpSGRpg&pid=ImgRaw&r=0',
            //         height: 140,
            //         width: 100,
            //       ),
            //     )),

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
          height: 5,
        ),
        Row(
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
              child: Text(
                'Minutes',
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: Text(
                'Action',
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10,),

        //product companies
        Row(
          children: [
            CircleAvatar(
              backgroundImage: Image.asset('name'),
              child: const Text('data'),
            )
          ],
        ),

        
     
             
      ],
    ));
  }
}

// https://www.youtube.com/watch?v=pGhexqLeths

//https://th.bing.com/th/id/R.78ab058529b639453db95b7ed2a5011f?rik=q%2fJtTs0jpSGRpg&pid=ImgRaw&r=0
