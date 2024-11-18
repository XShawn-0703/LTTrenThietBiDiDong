import '../B2/Sach.dart';

class DocGia {
  String _maDocGia;
  String _hoTen;
  List<Sach> _danhSachSach = [];

  DocGia(this._maDocGia, this._hoTen);

  //Getters
  String get maDocGia => _maDocGia;
  String get hoTen => _hoTen;
  List<Sach> get danhSachSach => _danhSachSach;

  //Setters
  set maDocGia(String maDocGia) {
    if (maDocGia.isNotEmpty) {
      _maDocGia = maDocGia;
    }
  }

  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  // Phương thức mượn sách
  bool muonSach(Sach sach) {
    if (sach.trangThaiMuon) {
      print("Sách '${sach.tenSach}' đã được mượn bởi người khác.");
      return false;
    }
    _danhSachSach.add(sach);
    sach.trangThaiMuon = true; // Cập nhật trạng thái sách
    print("Mượn sách '${sach.tenSach}' thành công.");
    return true;
  }

  // Phương thức trả sách
  bool traSach(Sach sach) {
    if (_danhSachSach.contains(sach)) {
      _danhSachSach.remove(sach);
      sach.trangThaiMuon = false; // Cập nhật trạng thái sách
      print("Trả sách '${sach.tenSach}' thành công.");
      return true;
    }
    print("Sách '${sach.tenSach}' không có trong danh sách mượn.");
    return false;
  }

  // Hiển thị thông tin độc giả
  void hienThiThongTin() {
    print('Mã độc giả: $_maDocGia');
    print('Họ tên: $_hoTen');
    print('Danh sách sách đã mượn:');
    for (Sach s in _danhSachSach) {
      print('  - ${s.tenSach}');
    }
  }
}
