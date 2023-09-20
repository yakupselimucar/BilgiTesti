import 'soru.dart';

//SORU BANKASI SORU TÜRÜNDE BİR LİST OLACAK NEDEN? ÇÜNKÜ CLASS DA ÖYLE TANIMLADIK.
class TestVeri {
  int _soruIndex = 0;

  final List<Soru> _soruBankasi = [
    Soru(
        soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü bir gündür', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür', soruYaniti: false),
    Soru(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır',
        soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir',
        soruYaniti: true),
    Soru(soruMetni: "Dünya'nın en büyük hayvanı fildir", soruYaniti: false)
  ];
//Dışarıdan değiştirilemeyen class'a erişmek istiyorsak bunun için bir metot oluştumamız gerekiyor.
  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    if (_soruIndex + 1 < _soruBankasi.length) {
      _soruIndex++;
    }
  }

  void soruIndexReset() {
    _soruIndex = 0;
  }

//dışarıdan erişilebilmesi için alt çizgi eklemedik.
  bool isTestFinished() {
    if (_soruIndex + 1 >= _soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }
}
