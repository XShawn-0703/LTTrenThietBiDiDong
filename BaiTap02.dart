import 'dart:io';
import 'dart:math';

void main() {
  double? a;

  // Vòng lặp để yêu cầu nhập a khác 0
  do {
    stdout.write('Nhập hệ số a (a ≠ 0): ');
    String? inputA = stdin.readLineSync();
    a = double.tryParse(inputA ?? '');

    if (a == null) {
      print('Vui lòng nhập một số hợp lệ.');
    } else if (a == 0) {
      print('Hệ số a phải khác 0. Vui lòng nhập lại.');
    }
  } while (a == null || a == 0);

  // Nhập hệ số b
  double? b;
  do {
    stdout.write('Nhập hệ số b: ');
    String? inputB = stdin.readLineSync();
    b = double.tryParse(inputB ?? '');

    if (b == null) {
      print('Vui lòng nhập một số hợp lệ.');
    }
  } while (b == null);

  // Nhập hệ số c
  double? c;
  do {
    stdout.write('Nhập hệ số c: ');
    String? inputC = stdin.readLineSync();
    c = double.tryParse(inputC ?? '');

    if (c == null) {
      print('Vui lòng nhập một số hợp lệ.');
    }
  } while (c == null);

  // Tính delta
  double delta = b * b - 4 * a * c;

  // Giải phương trình dựa trên delta
  if (delta < 0) {
    print('Phương trình vô nghiệm.');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phương trình có nghiệm kép: x = $x');
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có hai nghiệm phân biệt:');
    print('x1 = $x1');
    print('x2 = $x2');
  }
}
