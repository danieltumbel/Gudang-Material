import 'barang.dart';
import 'stack.dart';
import "dart:io";

class Gudang {
  List<Barang> daftarBarang = [];
  Map<String, Barang> mapBarang = {};

  StackRiwayat riwayat = StackRiwayat();

  void tambahBarang(
    String kode,
    String nama,
    int jumlah,
    String kategori,
    double harga,
    String lokasi,
  ) {
    Barang barangBaru = Barang(kode, nama, jumlah, kategori, harga, lokasi);

    daftarBarang.add(barangBaru);

    mapBarang[kode] = barangBaru;

    riwayat.push("Menambahkan barang $nama");

    print(
      "jumlah barang dalam list:"
      "${daftarBarang.length}",
    );
    simpanCSV();

    print("Barang berhasil ditambahkan.");
  }

  void tampilkanBarang() {
    if (daftarBarang.isEmpty) {
      print("Data barang kosong.");
      return;
    }

    print("\n===== DATA BARANG =====");

    for (var barang in daftarBarang) {
      print(barang);
    }
  }

  void cariBarang(String kode) {
    if (mapBarang.containsKey(kode)) {
      print("\nBarang ditemukan:");
      print(mapBarang[kode]);
    } else {
      print("Barang tidak ditemukan.");
    }
  }

  void updateStok(String kode, int stokBaru) {
    if (mapBarang.containsKey(kode)) {
      mapBarang[kode]!.jumlah = stokBaru;

      riwayat.push(
        "Update stok barang $kode "
        "menjadi $stokBaru",
      );
      simpanCSV();

      print("Stok berhasil diperbarui.");
    } else {
      print("Barang tidak ditemukan.");
    }
  }

  void hapusBarang(String kode) {
    if (mapBarang.containsKey(kode)) {
      Barang barang = mapBarang[kode]!;

      daftarBarang.remove(barang);

      mapBarang.remove(kode);

      riwayat.push("Menghapus barang ${barang.nama}");
      simpanCSV();
      print("Barang berhasil dihapus.");
    } else {
      print("Barang tidak ditemukan.");
    }
  }

  void simpanCSV() {
    File file = File("barang.csv");
    String data = "Kode,Nama,Jumlah,Kategori,Harga,Lokasi\n";

    for (var barang in daftarBarang) {
      data +=
          "${barang.kode},"
          "${barang.nama},"
          "${barang.jumlah},"
          "${barang.kategori},"
          "${barang.harga},"
          "${barang.lokasi}\n";
    }
    file.writeAsStringSync(data);
    print(file.absolute.path);
    print("Data berhasil disimpan.");
  }

  void bacaCSV() {
    File file = File("barang.csv");
    if (!file.existsSync()) {
      return;
    }
    List<String> baris = file.readAsLinesSync();
    daftarBarang.clear();
    mapBarang.clear();
    for (int i = 1; i < baris.length; i++) {
      List<String> data = baris[i].split(',');
      if (data.length >= 6) {
        Barang barang = Barang(
          data[0],
          data[1],
          int.parse(data[2]),
          data[3],
          double.parse(data[4]),
          data[5],
        );

        daftarBarang.add(barang);
        mapBarang[barang.kode] = barang;
      }
    }
  }
}
