
import 'package:flutter/foundation.dart';

void main() {
  List<Ogretmen> ogretmenler = [
    Ogretmen('Ali'),
    IngilizceOgretmeni('Verbs', 'John'),
    AlmancaOgretmeni('Artikels', 'Hans')
  ];

  for (final o in ogretmenler) {
    o.merhabaDe();
  }
}

class Ogretmen {
  String ad;

  Ogretmen(this.ad);

  void merhabaDe() {
    print('Merhaba ben $ad öğretmen');
  }
}

class IngilizceOgretmeni extends Ogretmen {
  String chapter;

  IngilizceOgretmeni(this.chapter, String name) : super(name);

  @override
  void merhabaDe() {
    super.merhabaDe();
    print('I am teacher $ad and I am at $chapter');
  }
}

class AlmancaOgretmeni extends Ogretmen {
  String thema;

  AlmancaOgretmeni(this.thema, String name) : super(name);

  @override
  void merhabaDe() {
    super.merhabaDe();
    print('Ich bin lehrer $ad und ich habe $thema');
  }
}