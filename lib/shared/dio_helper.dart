import 'dart:ui';

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8000/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> addBook(
      {required int category,
      required String name,
      required String description}) async {
    return await dio.post('path', data: {});
  }

  static Future<Response> deleteBook({required int id}) async {
    return await dio.post('path', data: {});
  }

  static Future<Response> editBook(
      {required int id,
      required String name,
      required String description}) async {
    return await dio.post('path', data: {});
  }

  static Future<Response> getBooksByCategory({required int categoryId}) async {
    return await dio.get('path');
  }
  static Future<Response> getCategories() async {
    return await dio.get('path');
  }
}
