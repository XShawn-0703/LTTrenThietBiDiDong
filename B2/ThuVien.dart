import 'DocGia.dart';
import 'Sach.dart';

class ThuVien {
  List<Sach> _danhSachSach = [];
  List<DocGia> _danhSachDocGia = [];

  // Getters
  List<Sach> get danhSachSach => _danhSachSach;
  List<DocGia> get danhSachDocGia => _danhSachDocGia;

  // Phương thức thêm sách
  void themSach(Sach sach) {
    _danhSachSach.add(sach);
    print("Đã thêm sách '${sach.tenSach}' vào thư viện.");
  }

  // Phương thức thêm độc giả
  void themDocGia(DocGia docGia) {
    _danhSachDocGia.add(docGia);
    print("Đã thêm độc giả '${docGia.hoTen}' vào thư viện.");
  }

  // Phương thức hiển thị danh sách sách
  void hienThiDanhSachSach() {
    print("\nDanh sách sách trong thư viện:");
    if (_danhSachSach.isEmpty) {
      print("Thư viện hiện chưa có sách.");
    } else {
      for (Sach sach in _danhSachSach) {
        sach.hienThiThongTin();
        print('--------------------');
      }
    }
  }

  // Phương thức hiển thị danh sách độc giả
  void hienThiDanhSachDocGia() {
    print("\nDanh sách độc giả trong thư viện:");
    if (_danhSachDocGia.isEmpty) {
      print("Thư viện hiện chưa có độc giả.");
    } else {
      for (DocGia docGia in _danhSachDocGia) {
        print("- ${docGia.hoTen}");
      }
    }
  }
}
