import 'package:bookly_app/Features/home/presentation/views/widgets/coustom_book_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utlis/styles.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            CustomBookDetailsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .2),
              child: CustomBookImage(),
            ),
            SizedBox(
              height: 43,
            ),
            Text(
              "The Jungle Book",
              style: Styles.textStyle30.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
            ),
            SizedBox(
              height: 6,
            ),
            Opacity(
              opacity: 0.7,
              child: Text(
                "Rudyard Kipling",
                style: Styles.textStyle18.copyWith(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
