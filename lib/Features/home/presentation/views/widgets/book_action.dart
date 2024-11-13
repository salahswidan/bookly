import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/utlis/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            // onPressed: () async {
            //   // Uri _url = Uri.parse(bookModel.volumeInfo.previewLink!);
            //   Uri _url = Uri.parse("https://google.com");

            //   try {
            //     if (await canLaunchUrl(_url)) {
            //       await launchUrl(_url);
            //     } else {
            //       print('Could not launch $_url');
            //     }
            //   } catch (e) {
            //     print('Error launching URL: $e');
            //   }
            // },
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
            text: ' Preview',
            fontSize: 16,
            backgroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          )),
        ],
      ),
    );
  }
}
