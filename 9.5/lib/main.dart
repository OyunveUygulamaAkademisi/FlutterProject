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

  void yeniOgrenciEkle(String yeniOgrenci) {
    setState(() {
      ogrenciler = [...ogrenciler, yeniOgrenci];
    });
  }

  @override
  Widget build(BuildContext context) {
    print('myhomepagestate build');

    final screenSize = mq.size;
    final desiredWidth = 600.0;
    final ratio = desiredWidth / screenSize.width;
    final mq = MediaQuery.of(context);
    return FractionallySizedBox(
      widthFactor: 1 / ratio,
      heightFactor: 1 / ratio,
      child: Transform.scale(
        scale: ratio,
        child: MediaQuery(
          data: mq.copyWith(
            viewInsets: mq.viewInsets.copyWith(
              bottom: mq.viewInsets.bottom / ratio,
            )
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: SinifBilgisi(
              sinif: sinif,
              baslik: baslik,
              ogrenciler: ogrenciler,
              yeniOgrenciEkle: yeniOgrenciEkle,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ArkaPlan(),
                  Positioned(
                    top: 100,
                    left: 10,
                    right: 10,
                    child: Sinif(),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 10,
                    right: 10,
                    child: OgrenciEkleme(),
                  ),
                  Positioned(
                    left: 30,
                    top: 30,
                    child: Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 30,
                    child: Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                  ),
                  Positioned(
                    right: 30,
                    bottom: 30,
                    child: Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    bottom: 30,
                    child: Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SinifBilgisi extends InheritedWidget {
  const SinifBilgisi({
    Key? key,
    required Widget child,
    required this.sinif,
    required this.baslik,
    required this.ogrenciler,
    required this.yeniOgrenciEkle,
  }) : super(key: key, child: child);

  final int sinif;
  final String baslik;
  final List<String> ogrenciler;
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  static SinifBilgisi of(BuildContext context) {
    final SinifBilgisi? result =
        context.dependOnInheritedWidgetOfExactType<SinifBilgisi>();
    assert(result != null, 'No SinifBilgisi found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SinifBilgisi old) {
    return sinif != old.sinif ||
      baslik != old.baslik ||
      ogrenciler != old.ogrenciler ||
      yeniOgrenciEkle != old.yeniOgrenciEkle;
  }
}

class Sinif extends StatelessWidget {
  const Sinif({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idealScreensize = Size(300, 600);
    final sinifBilgisi = SinifBilgisi.of(context);
    final screenSize = MediaQuery.of(context).size;
    final screenSizeRatio = idealScreensize.width / screenSize.width;
    print(screenSize);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.star,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                '${sinifBilgisi.sinif}. Sınıf ',
                textScaleFactor: 2 * screenSizeRatio,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 50,
              child: Icon(
                Icons.star,
              ),
            ),
          ],
        ),
        Text(
          sinifBilgisi.baslik,
          textScaleFactor: 1.5,
        ),
        OgrenciListesi(),

      ],
    );
  }
}

class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sinifBilgisi = SinifBilgisi.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final o in sinifBilgisi.ogrenciler)
          Text(
            o
          ),
      ],
    );
  }
}

class OgrenciEkleme extends StatefulWidget {

  const OgrenciEkleme({
    Key? key,
  }) : super(key: key);

  @override
  State<OgrenciEkleme> createState() => _OgrenciEklemeState();
}

class _OgrenciEklemeState extends State<OgrenciEkleme> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sinifBilgisi = SinifBilgisi.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          onChanged: (value) {
            setState(() {
            });
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: controller.text.isEmpty ? null : () {
              final yeniOgrenci = controller.text;
              sinifBilgisi.yeniOgrenciEkle(yeniOgrenci);
              controller.text = '';
              print(MediaQuery.of(context).size);
            },
            child: Text(
              'Ekle',
            ),
          ),
        ),
      ],
    );
  }
}

class ArkaPlan extends StatelessWidget {
  const ArkaPlan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Container(
          width: 50,
          height: 100,
          color: Colors.grey.shade100,
        ),
      ),
    );
  }
}

