import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/movie_events.dart';
import '../blocs/movies_bloc.dart';
import '../widgets/base_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>()..add(GetAllMoviesCategories());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BaseBlocBuilder<HomeBloc, HomeBlocState>(
              bloc: homeBloc,
              onSuccess: ({
                required HomeBlocState state,
              }) {
                final sectionsList = state.data;
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sectionsList?.length,
                  itemBuilder: (context, sectionsIndex) {
                    final sectionData = sectionsList![sectionsIndex].data;
                    final movies = sectionData!.movies;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          sectionData.category,
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (context, movieIndex) {
                              return CachedNetworkImage(
                                width: 100,
                                height: 100,
                                imageUrl: movies[movieIndex].getFullPath(),
                                placeholder: (context, value) => const CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              onEmpty: ({required HomeBlocState state}) => const Text(
                'empty',
              ),
              onError: ({required HomeBlocState state}) => const Text(
                'error',
              ),
              onLoading: ({required HomeBlocState state}) => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
