class Barang {
  String kode;
  String nama;
  int jumlah;
  String kategori;
  double harga;
  String lokasi;

  Barang(
    this.kode,
    this.nama,
    this.jumlah,
    this.kategori,
    this.harga,
    this.lokasi,
  );

  @override
  String toString() {
    print("=======================");
    return ("Kode: $kode"
        "\nNama: $nama"
        "\nJumlah: $jumlah"
        "\nKategori: $kategori"
        "\nHarga: $harga"
        "\nLokasi: $lokasi");
  }
}
