import 'DienThoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoaiBan, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach);

  // Getters và Setters với validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isNotEmpty && value.startsWith("HD-")) {
      _maHoaDon = value;
    } else {
      throw Exception("Mã hóa đơn không hợp lệ");
    }
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isBefore(DateTime.now())) {
      _ngayBan = value;
    } else {
      throw Exception("Ngày bán không thể sau ngày hiện tại");
    }
  }

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value > 0 && value <= _dienThoaiBan.soLuongTon) {
      _soLuongMua = value;
    } else {
      throw Exception("Số lượng mua không hợp lệ");
    }
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value > 0) {
      _giaBanThucTe = value;
    } else {
      throw Exception("Giá bán thực tế phải lớn hơn 0");
    }
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isNotEmpty) {
      _tenKhachHang = value;
    } else {
      throw Exception("Tên khách hàng không thể trống");
    }
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    if (value.isNotEmpty && value.length == 10) {
      _soDienThoaiKhach = value;
    } else {
      throw Exception("Số điện thoại khách hàng không hợp lệ");
    }
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuan() {
    return (_giaBanThucTe - _dienThoaiBan.giaNhap) * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print(
        "Mã: $_maHoaDon, Ngày bán: $_ngayBan, Điện thoại: ${_dienThoaiBan.tenDienThoai}, Số lượng: $_soLuongMua, Giá bán: $_giaBanThucTe, Khách: $_tenKhachHang, SĐT: $_soDienThoaiKhach");
  }

  // Getter cho dienThoaiBan
  DienThoai get dienThoaiBan => _dienThoaiBan;
}
