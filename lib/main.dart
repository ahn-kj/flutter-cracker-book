import 'package:flutter/material.dart';
import 'ui/books_header.dart';
import 'model/books_header_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class BooksHeaderModelsNotifier extends ChangeNotifier {
  List<BooksHeaderModel> booksHeaderModels = [];
  void update(List<BooksHeaderModel> booksHeaderModels) {
    this.booksHeaderModels.clear();
    this.booksHeaderModels.addAll(booksHeaderModels);
  }
}

class MyAppState extends State<MyApp> {
  List<BooksHeaderModel> models = [];
  void fetchAlbum() async {
    // final response = await http
    //     .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    final response = await http.get(Uri.parse(
        'http://selfdev.iptime.org:4004/cracker-service/api/books-header'));

    if (response.statusCode == 200) {
      print(response.body);
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      final models = parsed
          .map<BooksHeaderModel>((json) => BooksHeaderModel.fromJson(json));
      this.models.clear();
      this.models.addAll(models);

      //     .toList();
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return BooksHeaderModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    this.fetchAlbum();
  }

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
        home: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (context) => BooksHeaderModelsNotifier()),
            ],
            child: Scaffold(
                appBar: AppBar(
                  // Here we take the value from the MyHomePage object that was created by
                  // the App.build method, and use it to set our appbar title.
                  title: Text("Cracker Book"),
                ),
                body: Center(
                    child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          this.fetchAlbum();
                        },
                        child: Text("reload")),
                    BooksHeader(this.models)
                  ],
                )))));
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}
