import 'package:bookly_app/Features/home/data/custom_loading_indicator.dart';
import 'package:bookly_app/Features/home/presentation/manger/newset_book_cubit/newset_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utlis/custom_error_widget.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
  return ListView.builder(
    //  shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: state.books.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: BookListViewItem(
          bookModel: state.books[index],
        ),
      );
    },
  );
} else if(state is NewsetBooksFailure){
  return CustomErrorWidget(errorMessage: state.errMessage);
      } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
