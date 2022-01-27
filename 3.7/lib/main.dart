
void main() {

  print('merhaba!');


  returnEdecek();
}

void returnEdecek() {
  try {
    print('>main');
    hataliKoduCagiran();
    print('<main');
  } on FormatException catch (e) {
    print('format exception oldu!');
    rethrow;
  } catch (e) {
    print('başka bir hata oldu!');
    print(e);
  } finally {
    print('FINALLY!');
  }
  print('FINALLY\'DEN SONRA!');
}

void hataliKoduCagiran() {
  print('>hataliKoduCagiran');
  hataliKod();
  print('<hataliKoduCagiran');
}

void hataliKod() {
  print('>hataliKod');
  throw new Exception('HATA VAR!');
  double.parse("bu bir double değil");
  String? s = null;
  print(s!.length);
  print('<hataliKod');
}
