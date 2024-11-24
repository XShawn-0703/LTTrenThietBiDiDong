class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;

  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTon, this._trangThai);

  // Getter và setter với validation
  String get maDienThoai => _maDienThoai;

  set maDienThoai(String value) {
    // Kiểm tra mã điện thoại không được rỗng và có định dạng "DT-XXX"
    if (value.isEmpty || !RegExp(r"^DT-\d{3}$").hasMatch(value)) {
      throw Exception("Mã điện thoại phải không rỗng và có định dạng 'DT-XXX'");
    }
    _maDienThoai = value;
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String value) {
    if (value.isNotEmpty) {
      _tenDienThoai = value;
    } else {
      throw Exception("Tên điện thoại không thể trống");
    }
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String value) {
    if (value.isNotEmpty) {
      _hangSanXuat = value;
    } else {
      throw Exception("Hãng sản xuất không thể trống");
    }
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value > 0) {
      _giaNhap = value;
    } else {
      throw Exception("Giá nhập phải lớn hơn 0");
    }
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value > 0 && value > _giaNhap) {
      _giaBan = value;
    } else {
      throw Exception("Giá bán phải lớn hơn giá nhập");
    }
  }

  int get soLuongTon => _soLuongTon;
  set soLuongTon(int value) {
    if (value >= 0) {
      _soLuongTon = value;
    } else {
      throw Exception("Số lượng tồn kho không hợp lệ");
    }
  }

  bool get trangThai => _trangThai;
  set trangThai(bool value) {
    _trangThai = value;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return (_giaBan - _giaNhap) * _soLuongTon;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print(
        "Mã: $_maDienThoai, Tên: $_tenDienThoai, Hãng: $_hangSanXuat, Giá nhập: $_giaNhap, Giá bán: $_giaBan, Tồn kho: $_soLuongTon, Trạng thái: $_trangThai");
  }

  // Phương thức kiểm tra có thể bán không
  bool kiemTraBan() {
    return _soLuongTon > 0 && _trangThai;
  }
}
