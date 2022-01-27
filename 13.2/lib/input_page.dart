import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

enum Cinsiyet {
  kadin,
  erkek,
  bos,
}

const okullar = ['İlkokul', 'Ortaokul', 'Lise', 'Üniversite'];

class _InputPageState extends State<InputPage> {
  bool? evetMi = false;
  Cinsiyet? cinsiyet = Cinsiyet.bos;
  String? okul;
  double boy = 180;

  TextEditingController _yorumController = TextEditingController();

  @override
  void dispose() {
    _yorumController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Girdi Sayfası'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: evetMi,
                onChanged: (value) {
                  setState(() {
                    evetMi = value;
                  });
                },
              ),
              Text(
                'Evet mi? $evetMi'
              ),
              Radio<Cinsiyet>(
                value: Cinsiyet.kadin,
                groupValue: cinsiyet,
                onChanged: (value) {
                  setState(() {
                    cinsiyet = value;
                  });
                },
              ),
              Radio<Cinsiyet>(
                value: Cinsiyet.erkek,
                groupValue: cinsiyet,
                onChanged: (value) {
                  setState(() {
                    cinsiyet = value;
                  });
                },
              ),
              Text(
                  'Cinsiyet: $cinsiyet'
              ),
              DropdownButton<String>(
                items: okullar
                  .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (value) {
                  setState(() {
                    okul = value;
                  });
                },
                value: okul,
              ),
              Text(
                  'Okul: $okul'
              ),
              Slider(
                value: boy,
                min: 30,
                max: 300,
                onChanged: (value) {
                  setState(() {
                    boy = value;
                  });
                },
              ),
              Text(
                  'Boy: ${boy.toStringAsFixed(2)}'
              ),
              TextField(
                controller: _yorumController,
                onChanged: (value) {
                  setState(() {
                  });
                },
              ),
              Text(
                  'Yorum: ${_yorumController.text}',
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    evetMi = false;
                    cinsiyet = Cinsiyet.bos;
                    boy = 30;
                    okul = okullar[0];
                    _yorumController.text = '';
                  });
                },
                child: Text('sıfırla'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
