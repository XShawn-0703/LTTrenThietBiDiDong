import '../models/HoaDon.dart';
import '../models/DienThoai.dart';
import '../models/CuaHang.dart';

void main() {
  // Tạo cửa hàng
  CuaHang cuaHang = CuaHang("Cửa hàng điện thoại ABC", "123 Đường XYZ");

  // Tạo sản phẩm điện thoại
  DienThoai dt1 =
      DienThoai("DT-001", "iPhone 14", "Apple", 15000, 20000, 100, true);
  DienThoai dt2 = DienThoai(
      "DT-002", "Samsung Galaxy S23", "Samsung", 12000, 18000, 50, true);

  // Thêm điện thoại vào cửa hàng
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);

  // Hiển thị danh sách điện thoại
  print("Danh sách điện thoại:");
  cuaHang.hienThiDanhSachDienThoai();

  // Cập nhật thông tin điện thoại
  dt1.tenDienThoai = "iPhone 14 Pro";
  cuaHang.capNhatDienThoai(dt1);

  // Tạo hóa đơn bán hàng
  HoaDon hd1 = HoaDon(
      "HD-001", DateTime.now(), dt1, 2, 22000, "Nguyễn Văn C", "0987654321");
  HoaDon hd2 = HoaDon(
      "HD-002", DateTime.now(), dt2, 3, 19000, "Trần Thị B", "0934567890");

  // Tạo hóa đơn cho cửa hàng
  cuaHang.taoHoaDon(hd1);
  cuaHang.taoHoaDon(hd2);

  // Hiển thị danh sách hóa đơn
  print("\nDanh sách hóa đơn:");
  cuaHang.hienThiDanhSachHoaDon();

  // Tính tổng doanh thu trong ngày
  print(
      "\nTổng doanh thu hôm nay: ${cuaHang.tinhTongDoanhThu(DateTime.now().subtract(Duration(days: 1)), DateTime.now())}");

  // Tính tổng lợi nhuận trong ngày
  print(
      "\nTổng lợi nhuận hôm nay: ${cuaHang.tinhTongLoiNhuan(DateTime.now().subtract(Duration(days: 1)), DateTime.now())}");

  // Thống kê top điện thoại bán chạy
  cuaHang.thongKeTopDienThoaiBanChay(3);

  // Thống kê tồn kho
  cuaHang.thongKeTonKho();
}
