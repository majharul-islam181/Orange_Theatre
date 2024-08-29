part of 'trending_movies_bloc.dart';

abstract class TrendingMoviesEvent extends Equatable {
  const TrendingMoviesEvent();

  @override
  List<Object?> get props => [];
}

class FetchTrendingMoviesEvent extends TrendingMoviesEvent {

  const FetchTrendingMoviesEvent();


  @override
  List<Object?> get props => [];


}
