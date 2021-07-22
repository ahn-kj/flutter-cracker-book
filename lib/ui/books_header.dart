import 'package:flutter/material.dart';
import 'round_image_button.dart';
import '../model/books_header_model.dart';

class BooksHeader extends StatefulWidget {
  List<BooksHeaderModel> booksHeaderModels = [];
  BooksHeader(List<BooksHeaderModel> booksHeaderModels) {
    this.booksHeaderModels = booksHeaderModels;
  }
  @override
  BooksHeaderState createState() {
    return BooksHeaderState(this.booksHeaderModels);
  }

  void updateState(List<BooksHeaderModel> models) {
    this.booksHeaderModels.clear();
    this.booksHeaderModels.addAll(models);
  }
}

class BooksHeaderState extends State<BooksHeader> {
  double iconWidth = 100;
  double iconHeight = 100;
  Color iconBackgroundColor = Colors.red;
  double marginRow = 60;

  List<BooksHeaderModel> booksHeaderModels = [];

  BooksHeaderState(List<BooksHeaderModel> booksHeaderModels) {
    this.booksHeaderModels = booksHeaderModels;
  }

  List<Widget> _buidColumnList() {
    List<Widget> list = [];
    for (BooksHeaderModel model in this.booksHeaderModels) {
      list.add(Column(children: [
        RoundImageButton(iconWidth, iconHeight, model.imagePath,
            color: iconBackgroundColor),
        Text(model.title,
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ))
      ]));
      list.add(SizedBox(width: marginRow));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: _buidColumnList()));
  }
}
