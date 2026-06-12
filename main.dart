import 'dart:io';
import 'GUDANG.dart';
import 'sorting.dart';

void main() {
  Gudang gudang = Gudang();
  gudang.bacaCSV();

  while (true) {
    print("\n===== SISTEM MANAJEMEN GUDANG =====");

    print("1. Tambah Barang");
    print("2. Tampilkan Barang");
    print("3. Cari Barang");
    print("4. Update Stok");
    print("5. Hapus Barang");
    print("6. Barang Perlu Restok");
    print("7. Lihat Riwayat");
    print("0. Exit");

    stdout.write("Pilih menu : ");

    int pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        stdout.write("Kode Barang : ");
        String kode = stdin.readLineSync()!;

        stdout.write("Nama Barang : ");
        String nama = stdin.readLineSync()!;

        stdout.write("Stok Barang : ");
        int jumlah = int.parse(stdin.readLineSync()!);

        stdout.write("Kategori Barang :");
        String kategori = stdin.readLineSync()!;

        stdout.write("Harga Barang : ");
        double harga = double.parse(stdin.readLineSync()!);

        stdout.write("Lokaisi Barang :");
        String lokasi = stdin.readLineSync()!;

        gudang.tambahBarang(kode, nama, jumlah, kategori, harga, lokasi);

        break;

      case 2:
        gudang.tampilkanBarang();

        break;

      case 3:
        stdout.write("Masukkan kode barang : ");

        String kodeCari = stdin.readLineSync()!;

        gudang.cariBarang(kodeCari);

        break;

      case 4:
        stdout.write("Kode barang : ");

        String kodeUpdate = stdin.readLineSync()!;

        stdout.write("Stok baru : ");

        int stokBaru = int.parse(stdin.readLineSync()!);

        gudang.updateStok(kodeUpdate, stokBaru);

        break;

      case 5:
        stdout.write("Kode barang : ");

        String kodeHapus = stdin.readLineSync()!;

        gudang.hapusBarang(kodeHapus);

        break;

      case 6:
        Sorting sorting = Sorting();
        sorting.barangPerluRestok(gudang.daftarBarang);

        break;

      case 7:
        gudang.riwayat.tampilkanRiwayat();

        break;

      case 0:
        print("Program selesai.");
        return;

      default:
        print("Pilihan tidak valid.");
    }
  }
}
