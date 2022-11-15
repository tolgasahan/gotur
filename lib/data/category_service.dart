

import 'package:gotur/models/category.dart';

class CategoryService{
  static List<Category> products = List<Category>.empty(growable: true);

  static CategoryService _singleton = CategoryService._interval();

  factory CategoryService(){
    return _singleton;
  }



  CategoryService._interval();
  static List<Category> getAll(){
    products.add(Category(1, "https://www.thecountrycook.net/wp-content/uploads/2021/08/thumbnail-Stove-Top-Mac-Cheese-720x720.jpg", "Yeni Ürünler"));
    products.add(Category(2, "https://www.thecountrycook.net/wp-content/uploads/2021/08/thumbnail-Stove-Top-Mac-Cheese-720x720.jpg", "Başka Ürünler"));
    products.add(Category(3, "https://www.thecountrycook.net/wp-content/uploads/2021/08/thumbnail-Stove-Top-Mac-Cheese-720x720.jpg", "Deneme Ürünler"));
    products.add(Category(4, "https://www.thecountrycook.net/wp-content/uploads/2021/08/thumbnail-Stove-Top-Mac-Cheese-720x720.jpg", "Nasıl Ürünler"));


    return products;
  }
}