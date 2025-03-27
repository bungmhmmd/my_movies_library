import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_library/core/constants/font_size.dart';
import 'package:my_movies_library/core/utils/show_snack_bar.dart';
import 'package:my_movies_library/data/models/responses/movie_response.dart';
import 'package:my_movies_library/presentation/blocs/movie_bloc/movies_bloc.dart';
import 'package:my_movies_library/presentation/pages/filter_page.dart';
import 'package:my_movies_library/presentation/widgets/movie_card_widget.dart';
import 'package:my_movies_library/theme_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print('movie init');
    context.read<MoviesBloc>().add(FetchMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceAColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 36, 24, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Movies Library',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSizes.extraLarge(context),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<MoviesBloc, MoviesState>(
              listener: (context, state) {
                if (state.status == MoviesStatus.failure) {
                  showSnackbar(context, state.message, Colors.red);
                }
              },
              builder: (context, state) {
                if (state.status == MoviesStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == MoviesStatus.success) {
                  List<MovieResponse> movies = state.movies;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.7,
                        ),
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MovieCardWidget(movie: movies[index]);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
