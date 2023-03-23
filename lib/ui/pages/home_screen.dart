import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data_state.dart';
import '../../domain/entities/movie_card.dart';
import '../blocs/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeMoviesBloc>().add(GetHomeMoviesEventDayTimeWindow());
    return Scaffold(
      body: BlocBuilder<HomeMoviesBloc, DataState<Map<String, DataState<List<MovieCard>>>>>(
        bloc: context.read<HomeMoviesBloc>(),
        builder: (
          context,
          state,
        ) {
          return state.isLoading() ? CircularProgressIndicator() :
           Column(
            children: [
              Column(
                children: [
                  const Text('Aca van las trending'),
                  Row(
                    children: [
                      CachedNetworkImage(imageUrl: 'https://image.tmdb.org/t/p/w500${state.data!.values.first.data!.first.posterPath!}')
                    ],
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
