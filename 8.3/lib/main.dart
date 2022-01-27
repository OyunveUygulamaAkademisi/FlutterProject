import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    print('myapp yaratılıyor');
  }

  @override
  Widget build(BuildContext context) {
    print('myapp build');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key) {
    print('myhomepage yaratılıyor');
  }

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {
    print('myhomepagestate yaratılıyor');
  }

  @override
  void initState() {
    super.initState();
    ogrenciler.add('init');
  }

  var sinif = 5;
  var baslik = 'Öğrenciler';
  var ogrenciler = ['Ali', 'Ayşe', 'Can'];

  @override
  Widget build(BuildContext context) {
    print('myhomepagestate build');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.red,
              ),
              Text(
                '$sinif. Sınıf',
                textScaleFactor: 2,
              ),
              Icon(
                Icons.star,
              ),
            ],
          ),
          Text(
            baslik,
            textScaleFactor: 1.5,
          ),
          for (final o in ogrenciler)
            Text(
              o
            ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                ogrenciler.add('yeni');
              });
            },
            child: Text(
              'Ekle',
            ),
          ),
        ],
      ),
    );
  }
}
