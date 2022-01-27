import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MesajlarRepository extends ChangeNotifier {

  final List<Mesaj> mesajlar = [
    Mesaj("Merhaba", "Ali", DateTime.now().subtract(const Duration(minutes: 3))),
    Mesaj("Orada mısın?", "Ali", DateTime.now().subtract(const Duration(minutes: 2))),
    Mesaj("Evet", "Ayşe", DateTime.now().subtract(const Duration(minutes: 1))),
    Mesaj("Nasılsın", "Ayşe", DateTime.now()),
  ];
}

final mesajlarProvider = ChangeNotifierProvider((ref) {
  return MesajlarRepository();
});

class YeniMesajNotifier extends StateNotifier<int> {
  YeniMesajNotifier(int state) : super(state);

  void hepsiOkundu() {
    state = 0;
  }
}

final yeniMesajProvider = StateNotifierProvider<YeniMesajNotifier, int>((ref) {
  return YeniMesajNotifier(4);
});

class Mesaj {
  String yazi;
  String gonderen;
  DateTime zaman;

  Mesaj(this.yazi, this.gonderen, this.zaman);
}