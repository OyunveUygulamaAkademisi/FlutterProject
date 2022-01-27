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

  int aktifButon = 0;
  String istenenYazi = '';


  @override
  void initState() {
    super.initState();
  }


  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  bool checkliMi = false;
  String text = '';

  @override
  Widget build(BuildContext context) {
    print('myhomepagestate build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            YaziYazmaYeri(istenenYazi: istenenYazi),
            Text(text),
            Checkbox(
              value: checkliMi,
              onChanged: (value) {
                print(value);
                setState(() {
                  if (value != null) {
                    checkliMi = value;
                  }
                });
              },
            ),
            ElevatedButton(
              onPressed: aktifButon == 0 ? () {
                print('0');
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
                  istenenYazi = 'sifir';
                });
              } : null,
              child: Text('0'),
            ),
            ElevatedButton(
              onPressed: aktifButon == 1 ? () {
                print('1');
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
                  istenenYazi = 'bir';
                });
              } : null,
              child: Text('1'),
            ),
            ElevatedButton(
              onPressed: aktifButon == 2 ? () {
                print('2');
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
                  istenenYazi = 'iki';
                });
              } : null,
              child: Text('2'),
            ),
          ],
        ),
      ),
    );
  }
}

class YaziYazmaYeri extends StatefulWidget {
  final String istenenYazi;
  const YaziYazmaYeri({
    Key? key, required this.istenenYazi,
  }) : super(key: key);

  @override
  State<YaziYazmaYeri> createState() => _YaziYazmaYeriState();
}

class _YaziYazmaYeriState extends State<YaziYazmaYeri> {

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      print('yeni değer: ${controller.text}');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YaziYazmaYeri oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.istenenYazi != widget.istenenYazi) {
      controller.text = widget.istenenYazi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            controller.text = '';
          },
        )
      ),
    );
  }
}

