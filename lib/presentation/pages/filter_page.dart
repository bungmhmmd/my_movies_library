import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_library/core/constants/font_size.dart';
import 'package:my_movies_library/core/utils/show_snack_bar.dart';
import 'package:my_movies_library/data/models/responses/movie_response.dart';
import 'package:my_movies_library/presentation/blocs/search_movies_bloc/search_movies_bloc.dart';
import 'package:my_movies_library/presentation/widgets/movie_card_widget.dart';
import 'package:my_movies_library/theme_data.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceAColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 36, 24, 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                Text(
                  'Filter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSizes.extraLarge(context),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSizes.medium(context),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: titleController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search by title',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      filled: true,
                      fillColor: surfaceBColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadiusSize),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadiusSize),
                      color: primaryColor,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(borderRadiusSize),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(borderRadiusSize),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SearchMoviesBloc>().add(
                              SearchMoviesTitleEvent(
                                title: titleController.text,
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: Text(
                              'Submit',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<SearchMoviesBloc, SearchMoviesState>(
              listener: (context, state) {
                if (state.status == SearchMoviesStatus.failure) {
                  showSnackbar(context, state.message, Colors.red);
                }
              },
              builder: (context, state) {
                if (state.status == SearchMoviesStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == SearchMoviesStatus.success) {
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
