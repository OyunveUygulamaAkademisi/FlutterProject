
void main() {
  final List<int> l = [1, 2, 3];
  final Set<int> s = {1, 2, 3};
  final Map<int, int> m = {1: 10, 2: 20, 3: 30};

  for (final e in l) {
    print(e);
  }

  for (var i = 0; i < l.length; ++i) {
    print('$i: ${l[i]}');
  }

  for (final e in s) {
    print(e);
  }

  for (final e in m.entries) {
    print('${e.key}: ${e.value}');
  }

  for (final k in m.keys) {
    print(k);
  }

  for (final v in m.values) {
    print(v);
  }

}
