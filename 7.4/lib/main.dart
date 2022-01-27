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
            TextField(
              onChanged: (value) {
                print(value);
                setState(() {
                  text = value;
                  checkliMi = value.length.isEven;
                });
              },
            ),
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
                });
              } : null,
              child: Text('0'),
            ),
            ElevatedButton(
              onPressed: aktifButon == 1 ? () {
                print('1');
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
                });
              } : null,
              child: Text('1'),
            ),
            ElevatedButton(
              onPressed: aktifButon == 2 ? () {
                print('2');
                setState(() {
                  aktifButon = (aktifButon + 1) % 3;
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

