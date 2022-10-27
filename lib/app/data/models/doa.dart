class Doa {
  String? idDoa;
  String? nama;
  String? lafal;
  String? transliterasi;
  String? arti;
  String? riwayat;

  Doa(
      {this.idDoa,
      this.nama,
      this.lafal,
      this.transliterasi,
      this.arti,
      this.riwayat,});

  Doa.fromJson(Map<String, dynamic> json) {
    idDoa = json['id_doa'];
    nama = json['nama'];
    lafal = json['lafal'];
    transliterasi = json['transliterasi'];
    arti = json['arti'];
    riwayat = json['riwayat'];
  }

  }

