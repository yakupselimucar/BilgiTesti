import 'package:bilgi_testi/constants.dart';
import 'package:bilgi_testi/test_veri.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BilgiTesti());

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({super.key});

  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  void butonFonksiyonu(bool btnDegeri) {
    if (test_1.isTestFinished() == false) {
      //isTestFinished parantessiz olarak da çalışır.
      setState(
        () {
          test_1.getSoruYaniti() == btnDegeri
              ? secimler.add(kDogruIcon)
              : secimler.add(kYanlisIcon);
          test_1.sonrakiSoru();
        },
      );
    } else {
      //alertDialog gösterilecek
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: const Text('TEST TAMAMLANDI!'),
            content: const Text('Tebrikler Harika bir sonuç çıkardın.'),
            actions: [
              ElevatedButton(
                child: const Text('BAŞA DÖN!'),
                onPressed: () {
                  //Dialog kısmının kapatılmasını sağlar.
                  Navigator.of(context).pop();
                  setState(() {
                    //indexi sıfırla
                    test_1.soruIndexReset();
                    //seçimleri sıfırla
                    secimler = [];
                  });
                },
              ),
            ],
          );
        },
      );
    }
  }

  TestVeri test_1 = TestVeri();
  // test_1 test_veri sınıfındaki tüm sorulara sahip oldu.

  //-----------------------------ESKİ KULLANIM----------------------------------
  // List<String> sorular = [
  //   'Titanic gelmiş geçmiş en büyük gemidir',
  //   'Dünyadaki tavuk sayısı insan sayısından fazladır',
  //   'Kelebeklerin ömrü bir gündür',
  //   'Dünya düzdür',
  //   'Kaju fıstığı aslında bir meyvenin sapıdır',
  //   'Fatih Sultan Mehmet hiç patates yememiştir'
  // ];
  //
  // List<bool> yanitlar = [false, true, false, false, true, true];

  // Soru soru_1 = Soru(
  //     soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti: false);
  // Soru soru_2 = Soru(
  //     soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
  //     soruYaniti: true);
  // Soru soru_3 =
  //     Soru(soruMetni: 'Kelebeklerin ömrü bir gündür', soruYaniti: false);
  // Soru soru_4 = Soru(soruMetni: 'Dünya düzdür', soruYaniti: false);
  // Soru soru_5 = Soru(
  //     soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır', soruYaniti: true);
  // Soru soru_6 = Soru(
  //     soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir',
  //     soruYaniti: true);
//----------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //test_1.soruBankasi[soruIndex].soruMetni,
                test_1
                    .getSoruMetni(), // Artık değiştirilemeyen clasa uzaktan güvenilir bir şekilde eriştik.
                //test_1 adlı obejenin içindeki soruBankasi adlı listenin
                // belirtilen indexine ulaşıp onun soru metnini getir.
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        //ROW YERİNE WRAP İLE YAZDIK Kİ ALT SATIRA HATA VERMEDEN GEÇEBİLSİN.
        Wrap(
          spacing: 3,
          runSpacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          backgroundColor: Colors.red[400],
                          textStyle: const TextStyle(color: Colors.white)),
                      child: const Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        butonFonksiyonu(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          backgroundColor: Colors.green[400],
                          textStyle: const TextStyle(color: Colors.white)),
                      child: const Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        butonFonksiyonu(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
