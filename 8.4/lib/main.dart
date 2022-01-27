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

  void yeniOgrenciEkle(String text) {
    setState(() {
      ogrenciler.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('myhomepagestate build');


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Sinif(sinif: sinif, baslik: baslik, ogrenciler: ogrenciler, yeniOgrenciEkle: yeniOgrenciEkle),
    );
  }

}

class Sinif extends StatelessWidget {
  const Sinif({
    Key? key,
    required this.sinif,
    required this.baslik,
    required this.ogrenciler,
    required this.yeniOgrenciEkle,
  }) : super(key: key);

  final int sinif;
  final String baslik;
  final List<String> ogrenciler;
  final void Function(String text) yeniOgrenciEkle;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        OgrenciListesi(ogrenciler: ogrenciler),
        OgrenciEkleme(yeniOgrenciEkle: yeniOgrenciEkle),
      ],
    );
  }
}

class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({
    Key? key,
    required this.ogrenciler,
  }) : super(key: key);

  final List<String> ogrenciler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final o in ogrenciler) Text(o),
      ],
    );
  }
}

class OgrenciEkleme extends StatefulWidget {
  final void Function(String text) yeniOgrenciEkle;
  const OgrenciEkleme({
    Key? key, required this.yeniOgrenciEkle,
  }) : super(key: key);

  @override
  State<OgrenciEkleme> createState() => _OgrenciEklemeState();
}

class _OgrenciEklemeState extends State<OgrenciEkleme> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          onChanged: (value) {
            setState(() {
            });
          },
        ),
        ElevatedButton(
          onPressed: controller.text.isEmpty ? null : () {
            widget.yeniOgrenciEkle(controller.text);
            controller.text = '';
          },
          child: Text(
            'Ekle',
          ),
        ),
      ],
    );
  }
}
