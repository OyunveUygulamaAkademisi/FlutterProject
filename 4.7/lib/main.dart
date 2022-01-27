
void main() {
  final m = MyClass<String>('merhaba');

  print(m.val);

  m.kullan();
}

class MyClass<T> {
  T val;

  MyClass(this.val);

  void kullan() {
    print(val.length);
  }
}

