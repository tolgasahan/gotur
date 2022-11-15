import 'dart:async';

import 'package:gotur/data/category_service.dart';
import 'package:gotur/models/category.dart';


class CategoryBloc{
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;

  List<Category> getAll(){
    return CategoryService.getAll();
  }
}

final categoryBloc = CategoryBloc();