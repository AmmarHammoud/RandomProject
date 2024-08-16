import 'package:admin2/presentation/add_book/cubit/cubit.dart';
import 'package:admin2/presentation/add_book/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../admin_home/view/admin_home.dart';
import 'package:file_picker/file_picker.dart';

class AddrealestatePage extends StatefulWidget {
  @override
  _AddrealestatePageState createState() => _AddrealestatePageState();
}

class _AddrealestatePageState extends State<AddrealestatePage> {
  final _formKey = GlobalKey<FormState>();
  String? _realestateName;
  String? _description;
  String? _selectedCategory;

  final List<String> categories = [
    'House',
    'townhouse',
    'condo',
    'appartment',
  ];

  Future<void> _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {});
        print('file selected successfully');
      }
    } catch (e) {
      // Handle the error appropriately
      print('Error picking file: $e');
    }
  }

  void _AddrealestatePage() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newBook = realestate(
        _realestateName!,
        _description!,
      );

      // Add the new book to the appropriate category
      // ...

      // Clear the form
      _formKey.currentState!.reset();
      setState(() {
        _selectedCategory = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagingBooksCubit()..getCategories(),
      child: BlocConsumer<ManagingBooksCubit, ManagingBooksStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var addBookObject = ManagingBooksCubit.get(context);
          return Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 100, right: 100),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Category',
                      filled: true,
                      fillColor: const Color(0xFFFFEFCD),
                      labelStyle: const TextStyle(color: Color(0xffA68E74)),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffA68E74)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    value: _selectedCategory,
                    items: addBookObject.categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category.name,
                        child: Text(category.name,
                            style: const TextStyle(color: Color(0xff424530))),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    labelText: 'Realestate Name',
                    onSaved: (value) {
                      _realestateName = value;
                    },
                  ),
                  _buildTextField(
                    labelText: 'Description',
                    onSaved: (value) {
                      _description = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildButton(
                    text: 'Add Real',
                    onPressed: () {
                      // addBookObject.addBook(categoryId: _selectedCategory,
                      //     name: _realestateName,
                      //     description: _description)
                    },
                    color: const Color(0xffE09132),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required FormFieldSetter<String> onSaved,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: const Color(0xFFFFEFCD),
          labelStyle: const TextStyle(color: Color(0xffA68E74)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffA68E74)),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        style: const TextStyle(color: Color(0xff424530)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the $labelText';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFFFFEFCD),
          backgroundColor: color, // background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
