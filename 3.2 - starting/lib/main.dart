
void main() {

  print('Hoş geldiniz');

  final mesajlar = ['a', 'b', 'c'];

  for (var m in mesajlar) {
    print('mesaj: ');
    if (m == 'b') {
      break;
    }
    print('$m');
  }

  print('${mesajlar.length} adet okunmamış mesajınız var');


}