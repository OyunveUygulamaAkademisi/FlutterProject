

import 'ogrenci.dart';

void main() {

  print('merhaba!');

  Ogrenci o1 = Ogrenci('ali', 15);
  Ogrenci o2 = Ogrenci('ayşe', 18);
  Ogrenci o3 = Ogrenci('ahmet', 20);

  o1.merhabaDe();
  o2.merhabaDe();
  o3.merhabaDe();

  o1.siraArkadasi = o2;
  o2.siraArkadasi = o1;

  o1.merhabaDe();
  o2.merhabaDe();
  o3.merhabaDe();

  o1.siraArkadasininDogumGununuKutla();

  o1.merhabaDe();
  o2.merhabaDe();
  o3.merhabaDe();

}
