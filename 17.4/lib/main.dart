Future<void> main() async {
  await runTest();
}

Future<void> runTest() {
  return Future.delayed(Duration(seconds: 1))
      .then((value) {
        hataliAsync();
      })
      .then((value) => Future.delayed(Duration(seconds: 1)))
      .catchError((e) {
     print('yakalandı! $e');
  });
}

Future<void> hataliAsync() async {
  throw 'hata!';
}

