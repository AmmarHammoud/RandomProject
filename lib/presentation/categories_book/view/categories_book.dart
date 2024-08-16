import 'package:admin2/models/category_model.dart';
import 'package:admin2/presentation/add_book/cubit/cubit.dart';
import 'package:admin2/presentation/add_book/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../book_datails/view/book_datails.dart';

class CategoryBooksPage extends StatelessWidget {
  final CategoryModel categoryModel;

  CategoryBooksPage({required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagingBooksCubit()..getBooksByCategory(categoryId: categoryModel.id),
      child: BlocConsumer<ManagingBooksCubit, ManagingBooksStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var bookObject = ManagingBooksCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(categoryModel.name),
            ),
            body: ListView.builder(
              itemCount: bookObject.books.length,
              itemBuilder: (context, index) {
                //final book = booksList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RealeDetailsPage(book: bookObject.books[index])),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(bookObject.books[index].name),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: const Color(0xffA68E74),
                          onPressed: () {
                            // إضافة كود التعديل هنا
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            bookObject.deleteBook(id: bookObject.books[index].id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class RealModel {
  String name;
  String description;

  RealModel({
    required this.name,
    required this.description,
  });
}
