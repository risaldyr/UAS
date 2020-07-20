import 'package:flutter_test/flutter_test.dart';
import 'package:tugasuaspm/Nomor4/people.dart';


void main() {
  
  group("Mengecek Class People", () {
    Person p;
    p = Person();

    test("Inisialisasi Objek Person", () {
      expect(p.name, equals("Tidak Ada Nama"));
      expect(p.age, equals(0));
    });

    test("Age harus positif", () {
      p.age = -5;
      expect(p.age, isPositive);
    });

    test ("Angka keberuntungan harus 3 buah bilangan positif",(){
      expect(p.luckyNumbers, allOf([hasLength(equals(3)), isNot(anyElement(isNegative))]));
    });
  });
  setUp(() {
    print("set up");
  });
  tearDown((){
    print("Tear Down");
  });
}
