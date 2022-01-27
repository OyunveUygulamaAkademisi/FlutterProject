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
    setState(() {
      ogrenciler.add('Yeni arkadaş');
    });

  }

  int sinif = 5;
  String title = 'Öğrenciler';
  List<String> ogrenciler = ['Ali', 'Ayşe', 'Can'];
  String yeniOgrenci = '';

  @override
  Widget build(BuildContext context) {
    setState(() {
      ogrenciler.add('Yaramaz arkadaş');
    });
    print('myhomepagestate build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$sinif. sınıf',
              textScaleFactor: 2,
            ),
            Text(
              title,
              textScaleFactor: 1.5,
            ),
            for (final o in ogrenciler)
              Text(
                o,
              ),
            TextField(
              onChanged: (value) {
                yeniOgrenci = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ogrenciler.add(yeniOgrenci);
                });
              },
              child: Text(
                'Add'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
