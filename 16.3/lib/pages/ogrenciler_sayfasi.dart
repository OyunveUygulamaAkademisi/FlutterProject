import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';

class OgrencilerSayfasi extends ConsumerWidget {
  const OgrencilerSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Öğrenciler')),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                child: Text(
                  '${ogrencilerRepository.ogrenciler.length} Öğrenci'
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => OgrenciSatiri(
                ogrencilerRepository.ogrenciler[index],
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: ogrencilerRepository.ogrenciler.length,
            ),
          ),
        ],
      ),
    );
  }
}

class OgrenciSatiri extends ConsumerWidget {
  final Ogrenci ogrenci;
  const OgrenciSatiri(this.ogrenci, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool seviyorMuyum = ref.watch(ogrencilerProvider).seviyorMuyum(ogrenci);
    return ListTile(
      title: Text(ogrenci.ad + ' ' + ogrenci.soyad),
      leading: IntrinsicWidth(child: Center(child: Text(ogrenci.cinsiyet == 'Kadın' ? '👩‍🦰' : '👨‍🦰'))),
      trailing: IconButton(
        onPressed: () {
          ref.read(ogrencilerProvider).sev(ogrenci, !seviyorMuyum);
        },
        icon: Icon(seviyorMuyum ?  Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
