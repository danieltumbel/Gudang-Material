import "barang.dart";

class Sorting {
  void barangPerluRestok(List<Barang> daftarBarang) {
    if (daftarBarang.isEmpty) {
      print("Barang Kosong");
      return;
    }
    daftarBarang.sort((a, b) => a.jumlah.compareTo(b.jumlah));

    print("\n===== BARANG PERLU RESTOK =====");

    bool ditemukan = false;

    for (var barang in daftarBarang) {
      if (barang.jumlah < 5) {
        ditemukan = true;

        print(
          "${barang.nama} | "
          "Stok: ${barang.jumlah}",
        );
      }
    }

    if (!ditemukan) {
      print("Semua stok masih aman.");
    }
  }
}
