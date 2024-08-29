// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hotel_ui/bloc/product_details_bloc/product_details_bloc.dart';
// import 'package:hotel_ui/config/components/loading_widget.dart';
// import 'package:hotel_ui/main.dart';
// import 'package:readmore/readmore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../config/colors/color.dart';
// import '../../config/components/internet_exception_widget.dart';
// import '../../utils/enums.dart';
// import '../views.dart';

// class ProductScreen extends StatefulWidget {
//   final String roomId;
//   const ProductScreen({super.key, required this.roomId});

//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   late ProductDetailsBloc productDetailsBloc;
//   String? userId;

//   @override
//   void initState() {
//     super.initState();
//     _loadUser();
//     productDetailsBloc = ProductDetailsBloc(
//       productDetailsRepository: getIt(),
//     );
//   }

//   Future<void> _loadUser() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     setState(() {
//       userId = sharedPreferences.getString('userId');
//       if (kDebugMode) {
//         print('my user id');
//         print(userId);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocProvider(
//         create: (context) =>
//             productDetailsBloc..add(FetchRoomDetailsEvent(widget.roomId)),
//         child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
//           builder: (context, state) {
//             switch (state.roomDetails.status) {
//               case Status.loading:
//                 return const Center(child: LoadingWidget());

//               case Status.error:
//                 if (state.roomDetails.message == "No Internet Connection") {
//                   return InterNetExceptionWidget(
//                     onPress: () => productDetailsBloc
//                         .add(FetchRoomDetailsEvent(widget.roomId)),
//                   );
//                 }
//                 return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(state.roomDetails.message.toString()),
//                     ],
//                   ),
//                 );

//               case Status.completed:
//                 final productDetails = state.roomDetails.data;
//                 if (productDetails == null) {
//                   return const Center(child: Text('No details available.'));
//                 }

//                 final room = productDetails.room;
//                 if (kDebugMode) {
//                   print(widget.roomId);
//                   print('room::::::::');
//                   print(room);
//                 }

//                 return Stack(
//                   children: [
//                     CustomScrollView(
//                       slivers: <Widget>[
//                         const ImageWithAppBar(),
//                         SliverList(
//                           delegate: SliverChildBuilderDelegate(
//                             (BuildContext context, int index) {
//                               // final room = product.room[index];
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 24.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             room.title.toString(),
//                                             style: GoogleFonts.poppins(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 8.0),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         LocationWidget(
//                                           location: "Basundhara R/A, Dhaka",
//                                         ),
//                                         Row(
//                                           children: [
//                                             Text('BDT',
//                                                 style: GoogleFonts.poppins(
//                                                     fontSize: 18,
//                                                     fontWeight:
//                                                         FontWeight.w500)),
//                                             const SizedBox(
//                                               width: 5,
//                                             ),
//                                             Text(room.price.toString(),
//                                                 style: GoogleFonts.poppins(
//                                                     fontSize: 18,
//                                                     fontWeight:
//                                                         FontWeight.w500)),
//                                             Text(
//                                               '/day',
//                                               style: GoogleFonts.poppins(
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w400),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 16.0),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Container(
//                                               height: 32.0,
//                                               width: 32.0,
//                                               margin: const EdgeInsets.only(
//                                                   right: 8.0),
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     offset: const Offset(0, 4),
//                                                     blurRadius: 4.0,
//                                                     color: Colors.black
//                                                         .withOpacity(0.25),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                   'Majharul Islam',
//                                                   style: GoogleFonts.poppins(
//                                                       fontSize: 15,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                         RatingWidget(
//                                             rating: room.rating.toString()),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 20.0),
//                                     const Divider(
//                                         color: kOutlineColor, height: 1.0),
//                                     const SizedBox(height: 15),
//                                     Text(
//                                       "What they offer",
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                     const SizedBox(height: 10.0),
//                                     const ConstantFacilites(),
//                                     const SizedBox(height: 15),
//                                     const Divider(
//                                         color: kOutlineColor, height: 1.0),
//                                     const SizedBox(height: 16.0),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Text(
//                                               "Check In",
//                                               style: GoogleFonts.poppins(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w300),
//                                             ),
//                                             const SizedBox(height: 5),
//                                             const Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.av_timer,
//                                                   size: 20,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text('12.00 PM'),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                         Column(
//                                           children: [
//                                             Text(
//                                               "Check Out",
//                                               style: GoogleFonts.poppins(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w300),
//                                             ),
//                                             const SizedBox(height: 5),
//                                             const Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.av_timer,
//                                                   size: 20,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text('10.00 AM'),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 15),
//                                     const Divider(
//                                         color: kOutlineColor, height: 1.0),
//                                     const SizedBox(height: 15),
//                                     Text(
//                                       'Description: ',
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                     const SizedBox(height: 15),
//                                     ReadMoreText(
//                                       room.description,
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w300),
//                                       trimLines: 3,
//                                       textAlign: TextAlign.justify,
//                                       trimMode: TrimMode.Line,
//                                       trimCollapsedText: "  See more ",
//                                       trimExpandedText: "  See Less",
//                                       lessStyle: Theme.of(context)
//                                           .textTheme
//                                           .titleMedium,
//                                       moreStyle: GoogleFonts.poppins(
//                                           fontSize: 15,
//                                           color: Colors.green,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                     const SizedBox(height: 8.0),
//                                     const SizedBox(height: 16.0),
//                                     const Divider(
//                                         color: kOutlineColor, height: 1.0),
//                                     const SizedBox(height: 16.0),
//                                     Text(
//                                       'Ingredients',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleMedium,
//                                     ),
//                                     const SizedBox(height: 46.0),
//                                   ],
//                                 ),
//                               );
//                             },
//                             childCount: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Positioned(
//                       bottom: 1,
//                       left: 0,
//                       right: 0,
//                       child: Container(
//                         padding: const EdgeInsets.all(16.0),
//                         color: Colors.white.withOpacity(1),
//                         child: Row(
//                           children: [
//                             CallButtonWidget(
//                               phoneNumber: room.phoneNumber,
//                             ),
//                             const SizedBox(width: 10),
//                             BookNowWidget(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => SelectReservation(
//                                       price: room.price,
//                                       roomId: room.id,
//                                       userId: userId.toString(),
//                                       roomTitle: room.title,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 );

//               default:
//                 return const SizedBox();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
