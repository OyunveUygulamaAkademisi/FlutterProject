
class Ogrenci {
  String ad;
  int _yas;

  Ogrenci? siraArkadasi;


  Ogrenci(this.ad, this._yas);

  void merhabaDe() {
    print('Merhaba ben $ad, $_yas yaşındayım.');
    if (siraArkadasi != null) {
      print('Sıra arkadaşım: ${siraArkadasi!.ad}');
    }
  }

  void dogumGununuKutla() {
    _yas += 1;
  }

  void siraArkadasininDogumGununuKutla() {
    if (siraArkadasi != null) {
      print('$ad, sıra arkadaşının doğum gününü kutladı.');
      siraArkadasi!.dogumGununuKutla();
    }
  }
}