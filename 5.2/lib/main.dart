
void main() {
  final List<int> l = [1, 2, 3];
  final Set<int> s = {1, 2, 3};
  final Map<int, int> m = {1: 10, 2: 20, 3: 30};

  print([
    1, 23, 45, 44, 66,
    for (int i = 0; i < 3; ++i)
      if (i.isEven)
        ...([11111, 2222] + [3333]),
    if (1 == 2)
      88,
    for (int i = 0; i < 3; ++i)
      i,
  ]);

}
