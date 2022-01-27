
void main() {
  final iterable = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  print(iterable);

  final Iterable<String> map = iterable.map((e) => '$e sayısı');
  print(map);
}
