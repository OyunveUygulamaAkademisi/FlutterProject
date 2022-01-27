import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/models/ogretmen.dart';

class OgretmenlerRepository extends ChangeNotifier {

  List ogretmenler = [
    Ogretmen('Faruk', 'Yılmaz', 18, 'Erkek'),
    Ogretmen('Semiha', 'Çelik', 20, 'Kadın'),
  ];
  
  void download() {
    const j = """{
      "ad": "Yeni",
      "soyad": "Yenioğlu",
      "yas": 22,
      "cinsiyet": "Erkek"
    }""";

    final m = jsonDecode(j);

    final ogretmen = Ogretmen.fromMap(m);

    ogretmenler.add(ogretmen);
    notifyListeners();
  }
}

final ogretmenlerProvider = ChangeNotifierProvider((ref) {
  return OgretmenlerRepository();
});
