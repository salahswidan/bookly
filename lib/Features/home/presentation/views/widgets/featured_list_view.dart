import 'package:bookly_app/Features/home/data/custom_loading_indicator.dart';
import 'package:bookly_app/Features/home/presentation/manger/featrured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/core/utlis/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coustom_book_item.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              //  itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: const CustomBookImage(),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
