import 'package:admin2/models/category_model.dart';
import 'package:admin2/presentation/add_book/cubit/states.dart';
import 'package:admin2/shared/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/book_model.dart';

class ManagingBooksCubit extends Cubit<ManagingBooksStates> {
  ManagingBooksCubit() : super(ManagingBooksInitialState());

  static ManagingBooksCubit get(context) => BlocProvider.of(context);

  addBook({required int categoryId, required String name, required String description}) {
    emit(ManagingBooksLoadingState());
    //////////////////////////////////////////////////////
    DioHelper.addBook(category: categoryId, name: name, description: description)
        .then((value) {
      ///here fill the model

      emit(ManagingBooksSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ManagingBooksErrorState());
    });
    /////////////////////////////////////////////////////
  }

  deleteBook({required int id}) {
    emit(ManagingBooksLoadingState());
    DioHelper.deleteBook(id: id).then((value) {
      ///alert the admin
      emit(ManagingBooksSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ManagingBooksErrorState());
    });
  }

  editBook(
      {required int id, required String name, required String description}) {
    emit(ManagingBooksLoadingState());
    DioHelper.editBook(id: id, name: name, description: description)
        .then((value) {
      ///alert the admin
      emit(ManagingBooksSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ManagingBooksErrorState());
    });
  }

  List<BookModel> books = [];

  getBooksByCategory({required int categoryId}) {
    emit(ManagingBooksLoadingState());
    books.clear();
    DioHelper.getBooksByCategory(categoryId: categoryId).then((value) {
      ///fill the model
      for (int i = 0; i < value.data['data']; i++) {
        books.add(BookModel.fromJson(value.data['data'][i]));
      }
      emit(ManagingBooksSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ManagingBooksErrorState());
    });
  }

  List<CategoryModel> categories = [];

  getCategories() {
    emit(ManagingBooksLoadingState());
    categories.clear();
    DioHelper.getCategories().then((value) {
      for (int i = 0; i < value.data['data']; i++) {
        categories.add(value.data['data'][i]);
      }
      emit(ManagingBooksSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ManagingBooksErrorState());
    });
  }
}
