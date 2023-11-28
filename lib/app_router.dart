import 'package:flutter/material.dart';

class AppRouter {
  // late MoviesReposatry moviesReposatry;
  // late MovieCubit movieCubit;
  // AppRouter() {
  //   moviesReposatry = MoviesReposatry(MovieApis());
  //   movieCubit = MovieCubit(moviesReposatry);
  // }

  Route? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) => MovieCubit(moviesReposatry),
      //       child: const MovieScreen(),
      //     ),
      //   );
      // case movieDetalScreen:
      //   final movie = settings.arguments as Movie;
      //   return MaterialPageRoute(
      //       builder: (_) => MovieDetalScreen(
      //             movie: movie,
      //           ));
    }
    return null;
  }
}
