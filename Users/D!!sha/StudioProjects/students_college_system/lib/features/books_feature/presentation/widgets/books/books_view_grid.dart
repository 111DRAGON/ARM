import 'package:flutter/material.dart';
import 'package:students_college_system/features/books_feature/presentation/widgets/books/books_view_book_icon_card.dart';

class BooksViewGrid extends StatelessWidget {
  const BooksViewGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 50,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: .65,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const BooksViewBookIconCard();
      },
    );
  }
}
