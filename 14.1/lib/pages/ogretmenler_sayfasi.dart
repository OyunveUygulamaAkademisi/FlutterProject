import 'package:flutter/material.dart';

class OgretmenlerSayfasi extends StatefulWidget {
  const OgretmenlerSayfasi({Key? key}) : super(key: key);

  @override
  _OgretmenlerSayfasiState createState() => _OgretmenlerSayfasiState();
}

class _OgretmenlerSayfasiState extends State<OgretmenlerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Öğretmenler')),
      body: Container(

      ),
    );
  }
}
