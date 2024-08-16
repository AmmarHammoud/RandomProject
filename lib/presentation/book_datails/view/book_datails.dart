import 'package:admin2/models/book_model.dart';
import 'package:admin2/presentation/add_book/cubit/cubit.dart';
import 'package:admin2/presentation/add_book/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../categories_book/view/categories_book.dart';

class RealeDetailsPage extends StatelessWidget {
  final BookModel book;

  RealeDetailsPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagingBooksCubit(),
      child: BlocConsumer<ManagingBooksCubit, ManagingBooksStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var bookObject = ManagingBooksCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(book.name),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        book.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        book.description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // كود التعديل هنا
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text("Edit"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xffA68E74),
                              // لون النص عندما يكون الزر نشطًا
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              bookObject.deleteBook(id: book.id);
                            },
                            icon: const Icon(Icons.delete),
                            label: const Text("Delete"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
