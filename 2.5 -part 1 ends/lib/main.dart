
String globalA = 'global değişken a';

void main() {

  print(globalA);

  globalA = 'global a değişti';

  String a;

  a = 'a';

  final d = 'değişkenim' + a;

  print(d);

  if (1 == 1) {
    final a = 'içerideki a';
    print(a);
  }

  print('main çalıştı');
  altProgram();

}

void altProgram() {

  print(globalA);

  final a = 'başka bir a';

  print(a);

  print('altProgram çalıştı');

}

class C {
  int a = 1;
}