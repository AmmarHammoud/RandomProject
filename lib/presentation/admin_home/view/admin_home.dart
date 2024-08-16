import 'dart:io';

import 'package:admin2/presentation/add_book/cubit/cubit.dart';
import 'package:admin2/presentation/add_book/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_book/view/add_book.dart';
import '../../categories/view/categories.dart';

class BookManagerPage extends StatefulWidget {
  @override
  _BookManagerPageState createState() => _BookManagerPageState();
}

class _BookManagerPageState extends State<BookManagerPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Realestate',
              style: TextStyle(color: Color(0xff424530))),
          bottom: const TabBar(
            indicatorColor: Color(0xffE09132),
            labelColor: Color(0xffE09132),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Categories'),
              Tab(text: 'Add realestate'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesPage(),
            AddrealestatePage(),
          ],
        ),
      ),
    );
  }
}

class realestate {
  final String name;
  final String description;

  realestate(this.name, this.description);
}
