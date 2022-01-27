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
  }


  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  int _counter = 0;

  void _incrementCounter() {
    print('incrementcounter');
    setState(() {
      _counter++;
    });
  }

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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Yazi('şu anki değer $_counter'),
            Sayac(
              'dışarıdaki değer $_counter',
              ilkDeger: 3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Yazi extends StatelessWidget {
  final String icerik;
  const Yazi(this.icerik, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(icerik);
  }
}


class Sayac extends StatefulWidget {
  final String baslik;
  final int ilkDeger;
  const Sayac(this.baslik, {Key? key, required this.ilkDeger}) : super(key: key);

  @override
  _SayacState createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int sayi = 0;

  @override
  void initState() {
    super.initState();
    sayi = widget.ilkDeger;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          sayi++;
        });
      },
      child: Text(
        '${widget.baslik}, içerideki: $sayi',
      ),
    );
  }
}
