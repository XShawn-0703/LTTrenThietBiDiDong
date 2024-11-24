import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang {
  String tenCuaHang;
  String diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this.tenCuaHang, this.diaChi);

  // Các phương thức quản lý điện thoại:

  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
  }

  // Cập nhật thông tin điện thoại
  void capNhatDienThoai(DienThoai dienThoai) {
    var index = _danhSachDienThoai
        .indexWhere((d) => d.maDienThoai == dienThoai.maDienThoai);
    if (index != -1) {
      _danhSachDienThoai[index] = dienThoai;
    }
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanh(String maDienThoai) {
    var dienThoai = _danhSachDienThoai.firstWhere(
        (d) => d.maDienThoai == maDienThoai,
        orElse: () =>
            throw Exception('Không tìm thấy điện thoại với mã: $maDienThoai'));
    dienThoai.trangThai = false;
  }

  // Tìm kiếm điện thoại
  DienThoai? timKiemDienThoai(String maDienThoai) {
    return _danhSachDienThoai.firstWhere((d) => d.maDienThoai == maDienThoai,
        orElse: () =>
            throw Exception('Không tìm thấy điện thoại với mã: $maDienThoai'));
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    for (var dienThoai in _danhSachDienThoai) {
      print(
          'Mã: ${dienThoai.maDienThoai}, Tên: ${dienThoai.tenDienThoai}, Hãng: ${dienThoai.hangSanXuat}, Giá Bán: ${dienThoai.giaBan}, Tồn Kho: ${dienThoai.soLuongTon}');
    }
  }

  // Các phương thức quản lý hóa đơn:

  // Tạo hóa đơn mới (tự động cập nhật tồn kho)
  void taoHoaDon(HoaDon hoaDon) {
    var dienThoai = hoaDon.dienThoaiBan; // Dùng getter dienThoaiBan
    if (dienThoai.soLuongTon >= hoaDon.soLuongMua) {
      _danhSachHoaDon.add(hoaDon);
      dienThoai.soLuongTon -= hoaDon.soLuongMua; // Cập nhật số lượng tồn kho
    } else {
      throw Exception('Không đủ tồn kho để bán');
    }
  }

  // Tìm kiếm hóa đơn
  List<HoaDon> timKiemHoaDon(
      {String? maHoaDon, DateTime? ngayBan, String? tenKhachHang}) {
    return _danhSachHoaDon.where((hd) {
      if (maHoaDon != null && !hd.maHoaDon.contains(maHoaDon)) return false;
      if (ngayBan != null && hd.ngayBan != ngayBan) return false;
      if (tenKhachHang != null && !hd.tenKhachHang.contains(tenKhachHang))
        return false;
      return true;
    }).toList();
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTinHoaDon();
    }
  }

  // Các phương thức thống kê:

  // Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0.0, (sum, hd) => sum + hd.tinhTongTien());
  }

  // Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0.0, (sum, hd) => sum + hd.tinhLoiNhuan());
  }

  // Thống kê top điện thoại bán chạy
  List<DienThoai> thongKeTopDienThoaiBanChay(int topN) {
    var dienThoaiBanChay = <DienThoai, int>{};
    for (var hoaDon in _danhSachHoaDon) {
      var dienThoai = hoaDon.dienThoaiBan; // Dùng getter dienThoaiBan
      dienThoaiBanChay[dienThoai] =
          (dienThoaiBanChay[dienThoai] ?? 0) + hoaDon.soLuongMua;
    }

    var sortedList = dienThoaiBanChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value)); // Sắp xếp theo số lượng bán

    return sortedList
        .take(topN)
        .map((entry) => entry.key)
        .toList(); // Lấy top N điện thoại bán chạy
  }

  // Thống kê tồn kho
  void thongKeTonKho() {
    for (var dienThoai in _danhSachDienThoai) {
      print(
          'Điện thoại: ${dienThoai.tenDienThoai}, Tồn kho: ${dienThoai.soLuongTon}');
    }
  }
}
