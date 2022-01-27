void main() {
  print('main çalıştı');

  var max = 10;
  loop(max);
  print(max);
}

void loop(int max) {
  for (int i = 0; i < max; ++i) {
    print('number $i');
  }
}

