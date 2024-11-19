import 'package:flutter/material.dart';
import 'package:students_college_system/features/books_feature/presentation/widgets/books/books_view_details_part.dart';
import 'package:students_college_system/features/books_feature/presentation/widgets/books/books_view_grid.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            BooksViewDetailsPart(),
            BooksViewGrid(),
          ],
        ),
      ),
    );
  }
}
