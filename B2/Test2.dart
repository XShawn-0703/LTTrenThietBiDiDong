import '../B2/DocGia.dart';
import '../B2/Sach.dart';
import 'ThuVien.dart';

void main() {
  // Tạo thư viện
  ThuVien thuVien = ThuVien();

  // Tạo các sách
  Sach sach1 = Sach("S1", "Lập trình Dart cơ bản", "Nguyễn Văn A", false);
  Sach sach2 =
      Sach("S2", "Flutter từ cơ bản đến nâng cao", "Nguyễn Văn B", false);
  Sach sach3 =
      Sach("S3", "Thiết kế giao diện người dùng", "Nguyễn Văn C", false);

  // Thêm sách vào thư viện
  thuVien.themSach(sach1);
  thuVien.themSach(sach2);
  thuVien.themSach(sach3);

  // Tạo độc giả
  DocGia docGia1 = DocGia("DG1", "Nguyễn Văn A");
  DocGia docGia2 = DocGia("DG2", "Trần Văn B");

  // Thêm độc giả vào thư viện
  thuVien.themDocGia(docGia1);
  thuVien.themDocGia(docGia2);

  // Hiển thị danh sách sách và độc giả
  thuVien.hienThiDanhSachSach();
  thuVien.hienThiDanhSachDocGia();

  // Kiểm tra mượn/trả sách
  print("\nTest quy trình mượn sách:");
  docGia1.muonSach(sach1); // Độc giả 1 mượn sách 1
  docGia1.muonSach(sach2); // Độc giả 1 mượn sách 2
  docGia2.muonSach(sach1); // Độc giả 2 không thể mượn sách 1 (đã mượn)

  print("\nThông tin độc giả sau khi mượn:");
  docGia1.hienThiThongTin();
  docGia2.hienThiThongTin();

  print("\nTest trả sách:");
  docGia1.traSach(sach1); // Độc giả 1 trả sách 1
  docGia2.muonSach(sach1); // Độc giả 2 mượn sách 1 thành công

  print("\nThông tin độc giả sau khi trả sách:");
  docGia1.hienThiThongTin();
  docGia2.hienThiThongTin();

  // Hiển thị danh sách sách trong thư viện (để kiểm tra trạng thái)
  thuVien.hienThiDanhSachSach();
}
