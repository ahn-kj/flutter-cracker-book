import 'package:flutter/material.dart';
import 'ui/books_header.dart';
import 'model/books_header_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BooksHeaderModelsNotifier()),
  ], child: MyApp()));
}

class MyAppState extends State<MyApp> {
  void fetchAlbum(BuildContext context) async {
    // final response = await http
    //     .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    final response = await http.get(Uri.parse(
        'http://selfdev.iptime.org:4004/cracker-service/api/books-header'));

    if (response.statusCode == 200) {
      print(response.body);
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      final models = parsed
          .map<BooksHeaderModel>((json) => BooksHeaderModel.fromJson(json))
          .toList();
      context.read<BooksHeaderModelsNotifier>().update(models);

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
        home: Scaffold(
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
                      this.fetchAlbum(context);
                    },
                    child: Text("reload")),
                BooksHeader(context
                    .watch<BooksHeaderModelsNotifier>()
                    .booksHeaderModels)
              ],
            ))));
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}
