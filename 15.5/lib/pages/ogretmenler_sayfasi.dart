import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

class OgretmenlerSayfasi extends ConsumerWidget {
  const OgretmenlerSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogretmenlerRepository = ref.watch(ogretmenlerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Öğretmenler')),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                child: Text(
                    '${ogretmenlerRepository.ogretmenler.length} Öğretmen'
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => OgretmenSatiri(
                ogretmenlerRepository.ogretmenler[index],
                ogretmenlerRepository,
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: ogretmenlerRepository.ogretmenler.length,
            ),
          ),
        ],
      ),
    );
  }

}

class OgretmenSatiri extends StatefulWidget {
  final Ogretmen ogretmen;
  final OgretmenlerRepository ogretmenlerRepository;
  const OgretmenSatiri(this.ogretmen, this.ogretmenlerRepository, {
    Key? key,
  }) : super(key: key);

  @override
  State<OgretmenSatiri> createState() => _OgretmenSatiriState();
}

class _OgretmenSatiriState extends State<OgretmenSatiri> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.ogretmen.ad + ' ' + widget.ogretmen.soyad),
      leading: IntrinsicWidth(child: Center(child: Text(widget.ogretmen.cinsiyet == 'Kadın' ? '👩‍🦰' : '👨‍🦰'))),
    );
  }
}
