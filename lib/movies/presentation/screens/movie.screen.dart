// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies.bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies.event.dart';
import 'package:movies_app/movies/presentation/controller/movies.state.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MoviesBloc()..add(GetPopularMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (BuildContext context, MoviesState state) {
          print(state);
          return Scaffold(
            body: ListView.builder(
              itemCount: state.nowPlayingMovies.length,
              itemBuilder: (context, index) =>
                  Text(state.nowPlayingMovies[index].title),
            ),
          );
        },
      ),
    );
  }
}
