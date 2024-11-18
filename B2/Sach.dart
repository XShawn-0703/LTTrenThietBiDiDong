class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThaiMuon;

  //constructor
  Sach(this._maSach, this._tenSach, this._tacGia, this._trangThaiMuon);

  //Getters
  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tacGia => _tacGia;
  bool get trangThaiMuon => _trangThaiMuon;

  //Setters
  set maSach(String maSach) {
    if (maSach.isNotEmpty) {
      _maSach = maSach;
    }
  }

  set tenSach(String tenSach) {
    if (tenSach.isNotEmpty) {
      _tenSach = tenSach;
    }
  }

  set tacGia(String tacGia) {
    if (tacGia.isNotEmpty) {
      _tacGia = tacGia;
    }
  }

  set trangThaiMuon(bool trangThaiMuon) {
    _trangThaiMuon = trangThaiMuon;
  }

  void hienThiThongTin() {
    print('Ma Sach: $_maSach');
    print('Ten Sach: $_tenSach');
    print('Tac gia: $_tacGia');
    print('Trang thai muon: ${_trangThaiMuon ? 'Da muon' : 'Co san'}');
  }
}
