import 'package:admin2/presentation/add_book/cubit/cubit.dart';
import 'package:admin2/presentation/add_book/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../categories_book/view/categories_book.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    'House',
    'TownHouse',
    'Appartment',
    'condo',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagingBooksCubit()..getCategories(),
      child: BlocConsumer<ManagingBooksCubit, ManagingBooksStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var categoriesObject = ManagingBooksCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 2 / 1,
                ),
                itemCount: categoriesObject.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryBooksPage(
                              categoryModel: categoriesObject.categories[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffFFEFCD),
                        // border: Border.all(color: Color(0xff424530)),
                        borderRadius:
                            BorderRadius.circular(10.0), // تدوير الحواف
                      ),
                      child: Center(
                        child: Text(
                          categoriesObject.categories[index].name,
                          style: const TextStyle(
                              color: Color(0xff424530),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
