part of 'trending_movies_bloc.dart';

abstract class TrendingMoviesEvent extends Equatable {

  const TrendingMoviesEvent();

  @override
  List<Object?> get props => [];
}

class FetchTrendingMoviesEvent extends TrendingMoviesEvent {
  final int page;
  const FetchTrendingMoviesEvent({this.page=1});


  @override
  List<Object?> get props => [page];


}
