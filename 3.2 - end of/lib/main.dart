
void main() {

  final mesajlar = <String>[];

  mesajlar.add('a');

  final c = 'a'[0];

  final Set<String> arkadaslar = {'ali', 'ayşe', 'mehmet'};

  final Map<String, num> etiketler = {
    'arkadaşlar': 1.4,
    'okul': 3,
    'iş': 5,
  };

  print(mesajlar);
  print(arkadaslar);
  print(etiketler);

  print(etiketler['iş']);
  etiketler['iş'] = 7;
  print(etiketler);

  if (etiketler.isNotEmpty) {
    print('boş değil');
  }

  print(etiketler.containsKey('okul'));

  for(final entry in etiketler.entries) {
    print('${entry.key}: ${entry.value}');
  }



}