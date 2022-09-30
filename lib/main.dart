import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar(
        glow: false,//スライド時にホバー色を消す時はfalseにして対応
        allowHalfRating: true,//0.5評価をするときはtrueにして対応
        updateOnDrag: true,//スライド時にonRatingUpdateが更新するかどうかtrueなら更新される
        initialRating: 5,//初期値
        minRating: 1,//最小値
        maxRating: 10,//最大値
        itemCount: 10,//個数
        itemSize: 30,//アイコンサイズ
        itemPadding: EdgeInsets.all(2),//余白調整
        ratingWidget: RatingWidget(//必須
            full: const Icon(Icons.star, color: Colors.amber),//活性表示
            half: const Icon(Icons.star_half, color: Colors.amber),//半分表示
            empty: const Icon(Icons.star_border, color: Colors.grey)),//非活性表示
        onRatingUpdate: (rating) {//必須
          _rating = rating;
        },
      ),
    );
  }

}
