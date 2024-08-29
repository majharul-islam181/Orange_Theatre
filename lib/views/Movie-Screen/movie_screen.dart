import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 22.0),
            child: Icon(
              Icons.favorite_outline_sharp,
              size: 19,
              color: Colors.white,
            ),
          )
        ],
        // backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(15),
                  //   bottomRight: Radius.circular(15),
                  // ),
                ),
                child: Column(
                  children: [
                    Image.network(
                      'https://th.bing.com/th/id/R.78ab058529b639453db95b7ed2a5011f?rik=q%2fJtTs0jpSGRpg&pid=ImgRaw&r=0', // Replace with your image URL
                      fit: BoxFit.cover, // Adjust the image fit as needed
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// https://www.youtube.com/watch?v=pGhexqLeths
