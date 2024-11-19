import 'package:flutter/material.dart';

import 'package:students_college_system/features/books_feature/presentation/widgets/book_details/book_details_button_part.dart';
import 'package:students_college_system/features/books_feature/presentation/widgets/book_details/book_details_part.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BookDetailsPart(),
          BookDetailsButtonPart()
        ],
      ),
    );
  }
}
