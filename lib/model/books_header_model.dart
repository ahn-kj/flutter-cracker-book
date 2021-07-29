import 'package:flutter/material.dart';

class BooksHeaderModelsNotifier extends ChangeNotifier {
  List<BooksHeaderModel> _booksHeaderModels = [];
  List<BooksHeaderModel> get booksHeaderModels => _booksHeaderModels;
  void update(List<BooksHeaderModel> booksHeaderModels) {
    this._booksHeaderModels.clear();
    this._booksHeaderModels.addAll(booksHeaderModels);
    notifyListeners();
  }

  void add(BooksHeaderModel model) {
    this._booksHeaderModels.add(model);
    notifyListeners();
  }

  void addFirst(BooksHeaderModel model) {
    this._booksHeaderModels.insert(0, model);
    notifyListeners();
  }
}

class BooksHeaderModel {
  int id = 0;
  String title = "";
  String imagePath = "";
  BooksHeaderModel({int? id, String? title, String? imagePath}) {
    this.id = id ?? 0;
    this.title = title ?? "";
    this.imagePath = imagePath ?? "";
  }
  factory BooksHeaderModel.fromJson(Map<String, dynamic> json) {
    return BooksHeaderModel(
      id: json['id'],
      title: json['title'],
      imagePath: json['imagePath'],
    );
  }
}
