// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:orange_theatre/bloc/trending_movies_bloc/trending_movies_bloc.dart';
// import 'package:orange_theatre/config/components/internet_exception_widget.dart';
// import 'package:orange_theatre/config/components/loading_widget.dart';
// import 'package:orange_theatre/main.dart';
// import 'package:orange_theatre/utils/enums.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   late TrendingMoviesBloc trendingMoviesBloc;

//   @override
//   void initState() {
//     super.initState();
//     trendingMoviesBloc = TrendingMoviesBloc(trendingMoviesRepository: getIt());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Orange Theatre",
//             style: TextStyle(
//               fontFamily: 'Netflix',
//               fontSize: 30,
//               fontWeight: FontWeight.w800,
//               color: Colors.orange,
//               letterSpacing: 4,
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//         ),
//         body: BlocProvider(
//           create: (context) => trendingMoviesBloc
//             ..add(
//               const FetchTrendingMoviesEvent(),
//             ),
//           child: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
//             builder: (context, state) {
//               switch (state.trendingMoviesList.status) {
//                 case Status.loading:
//                   return const Center(child: LoadingWidget());

//                 case Status.error:
//                   if (state.trendingMoviesList.message ==
//                       "No Internet Connection") {
//                     return InterNetExceptionWidget(
//                       onPress: () => trendingMoviesBloc
//                           .add(const FetchTrendingMoviesEvent()),
//                     );
//                   }
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(state.trendingMoviesList.message.toString()),
//                       ],
//                     ),
//                   );

//                 case Status.completed:
//                   final productDetails = state.trendingMoviesList.data;
//                   if (productDetails == null) {
//                     return const Center(child: Text('No details available.'));
//                   }
//                   return SizedBox(
//                     width: double.infinity,
//                     child: CarouselSlider.builder(
//                         itemCount: 10,
//                         itemBuilder: (context, itemIndex, pageViewIndex) {
//                           return ClipRRect(
//                             borderRadius: BorderRadius.circular(13),
//                             child: Container(
//                               height: 300,
//                               width: 200,
//                               color: Colors.amber,
//                             ),
//                           );
//                         },
//                         options: CarouselOptions(
//                             height: 300,
//                             autoPlay: true,
//                             viewportFraction: 0.55,
//                             enlargeCenterPage: true,
//                             pageSnapping: true,
//                             autoPlayCurve: Curves.fastOutSlowIn,
//                             autoPlayAnimationDuration:
//                                 const Duration(seconds: 1))),
//                   );

//                 default:
//                   const SizedBox();
//               }
//             },
//           ),
//         ));
//   }
// }
