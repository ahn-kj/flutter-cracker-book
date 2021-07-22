import 'package:flutter/material.dart';

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
