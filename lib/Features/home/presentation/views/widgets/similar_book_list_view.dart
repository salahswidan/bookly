import 'dart:math';

import 'package:bookly_app/Features/home/presentation/manger/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/coustom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utlis/custom_error_widget.dart';
import '../../../data/custom_loading_indicator.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CustomBookImage(
                    imageUrl: state
                            .books[index].volumeInfo.imageLinks?.thumbnail ??
                        'https://m.media-amazon.com/images/I/41yJ75yWVjL._SX324_BO1,204,203,200_.jpg',
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBookFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
