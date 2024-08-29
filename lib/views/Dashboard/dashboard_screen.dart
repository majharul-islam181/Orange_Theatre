import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_theatre/bloc/trending_movies_bloc/trending_movies_bloc.dart';
import 'package:orange_theatre/bloc/upcoming_movies_bloc/upcoming_movies_bloc.dart';
import 'package:orange_theatre/config/colors/color.dart';
import 'package:orange_theatre/config/components/internet_exception_widget.dart';
import 'package:orange_theatre/config/components/loading_widget.dart';
import 'package:orange_theatre/main.dart';
import 'package:orange_theatre/utils/enums.dart';
import 'package:orange_theatre/views/widgets/top_trending_item.dart';
import 'package:orange_theatre/views/widgets/top_upcoming_item.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late TrendingMoviesBloc trendingMoviesBloc;
  late UpcomingMoviesBloc upcomingMoviesBloc;
  bool hasInternetConnection = true;

  @override
  void initState() {
    super.initState();
    trendingMoviesBloc = TrendingMoviesBloc(trendingMoviesRepository: getIt());
    upcomingMoviesBloc = UpcomingMoviesBloc(upcomingMoviesRepository: getIt());
  }

  @override
  void dispose() {
    super.dispose();
    trendingMoviesBloc.close();
    upcomingMoviesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: _builAppBar(),
          ),
          SliverToBoxAdapter(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _builAppBar() {
    return AppBar(
      title: const Text(
        "Orange Theatre",
        style: TextStyle(
          fontFamily: 'Netflix',
          fontSize: 30,
          fontWeight: FontWeight.w800,
          color: Colors.orange,
          letterSpacing: 4,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Text(
              "Find and Watch",
              style: TextStyle(
                color: AppColor.labelColor,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Top Trending Movies",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          // _buildCities(),
          const SizedBox(
            height: 15,
          ),
          _topTrendingMovies(),
          const SizedBox(
            height: 10,
          ),
          _topUpcomingMovies(),
          // if (!hasInternetConnection)
          //   InterNetExceptionWidget(
          //     onPress: () {
          //       trendingMoviesBloc.add(const FetchTrendingMoviesEvent());
          //       upcomingMoviesBloc.add(const FetchUpcomingMoviesEvent());

          //       setState(() {
          //         hasInternetConnection = true;
          //       });
          //     },
          //   ),
        ],
      ),
    );
  }

  _topTrendingMovies() {
    return BlocProvider(
      create: (context) => trendingMoviesBloc
        ..add(
          const FetchTrendingMoviesEvent(),
        ),
      child: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
        builder: (context, state) {
          switch (state.trendingMoviesList.status) {
            case Status.loading:
              return const Center(child: LoadingWidget());

             case Status.error:
              if (state.trendingMoviesList.message == "No Internet Connection") {
               return InterNetExceptionWidget(
                  onPress: () =>
                      trendingMoviesBloc.add(const FetchTrendingMoviesEvent()),
                );
              }
              return Center(
                child: Text(state.trendingMoviesList.message.toString()),
              );

            case Status.completed:
              return CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .41,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  viewportFraction: .75,
                  autoPlay: false,
                ),
                items: List.generate(
                  state.trendingMoviesList.data!.results.length,
                  (index) => TopTrendingItem(
                    data: state.trendingMoviesList.data!.results[index],
                    // onTapFavorite: () {
                    //   setState(() {
                    //     state.trendingMoviesList.data[index]["is_favorited"] =
                    //         !state.trendingMoviesList.data[index]["is_favorited"];
                    //   });
                    // },
                  ),
                ),
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  _topUpcomingMovies() {
    return BlocProvider(
      create: (context) => upcomingMoviesBloc
        ..add(
          const FetchUpcomingMoviesEvent(),
        ),
      child: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
        builder: (context, state) {
          switch (state.upcomingMoviesList.status) {
            case Status.loading:
              return const Center(child: LoadingWidget());

           case Status.error:
              if (state.upcomingMoviesList.message == "No Internet Connection") {
                return InterNetExceptionWidget(
                  onPress: () =>
                      upcomingMoviesBloc.add(const FetchUpcomingMoviesEvent()),
                );
              }
              return Center(
                child: Text(state.upcomingMoviesList.message.toString()),
              );

            case Status.completed:
              return CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .41,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  viewportFraction: .75,
                  autoPlay: false,
                ),
                items: List.generate(
                  state.upcomingMoviesList.data!.results.length,
                  (index) => TopUpcomingItem(
                    data: state.upcomingMoviesList.data!.results[index],
                    // onTapFavorite: () {
                    //   setState(() {
                    //     state.trendingMoviesList.data[index]["is_favorited"] =
                    //         !state.trendingMoviesList.data[index]["is_favorited"];
                    //   });
                    // },
                  ),
                ),
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}










