import 'package:flutter/material.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

class OgretmenlerSayfasi extends StatefulWidget {
  final OgretmenlerRepository ogretmenlerRepository;
  const OgretmenlerSayfasi(this.ogretmenlerRepository, {Key? key}) : super(key: key);

  @override
  _OgretmenlerSayfasiState createState() => _OgretmenlerSayfasiState();
}

class _OgretmenlerSayfasiState extends State<OgretmenlerSayfasi> {
  @override
  Widget build(BuildContext context) {
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
                    '${widget.ogretmenlerRepository.ogretmenler.length} Öğretmen'
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => OgretmenSatiri(
                widget.ogretmenlerRepository.ogretmenler[index],
                widget.ogretmenlerRepository,
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: widget.ogretmenlerRepository.ogretmenler.length,
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
