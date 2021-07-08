import 'package:flutter/material.dart';
import 'ui/books_header.dart';
import 'model/books_header_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  List<BooksHeaderModel> models = [
    BooksHeaderModel("토론", "assets/images/chats.svg"),
    BooksHeaderModel("발표", "assets/images/microphone.svg"),
    BooksHeaderModel("글쓰기", "assets/images/note.svg"),
    BooksHeaderModel("포트폴리오", "assets/images/desktop.svg"),
    BooksHeaderModel("기타", "assets/images/etc.svg"),
    BooksHeaderModel("기타", "assets/images/etc.svg"),
    BooksHeaderModel("기타", "assets/images/etc.svg"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text("Cracker Book"),
            ),
            body: Center(child: BooksHeader(this.models))));
  }
}
