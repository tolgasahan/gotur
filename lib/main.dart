import 'package:flutter/material.dart';
import 'package:gotur/widgets/bottom_bar.dart';
import 'package:gotur/widgets/homepage_widgets/category_list_widget.dart';
import 'package:gotur/widgets/homepage_widgets/top_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "götür",
            style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TopBar(),
            Expanded(
                child: CategoryListWidget(),
            ),
            Row(
              children: <Widget>[
                BottomBar(Icons.home, Colors.purple),
                BottomBar(Icons.search, Colors.blueGrey),
                BottomBar(Icons.person, Colors.blueGrey),
                BottomBar(Icons.card_giftcard, Colors.blueGrey),
              ],
            ),
          ],
        ));
  }
}
