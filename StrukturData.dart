import 'dart:io'; 

// Kelas untuk mendefinisikan objek tugas
class Tugas {
  String judul; // Judul tugas
  DateTime tenggat; // Tenggat waktu tugas
  bool selesai; // Status tugas (selesai atau belum)

  // Konstruktor untuk inisialisasi objek Tugas
  Tugas(this.judul, this.tenggat) : selesai = false;

  // Metode untuk menghasilkan representasi string dari objek Tugas
  String toString() {
    // Menentukan status tugas (Selesai/Belum Selesai)
    String status = selesai ? "Selesai" : "Belum Selesai";
    // Mengembalikan string dengan format: judul - tenggat - status
    return "$judul - ${tenggat.toLocal()} - $status";
  }
}
    
// Fungsi untuk menambahkan tugas baru ke dalam daftar tugas
void tambahTugas(List<Tugas> daftarTugas) {
  print("Masukkan judul tugas: ");
  String judul = stdin.readLineSync()!; // Membaca input judul tugas dari pengguna

  print("Masukkan tenggat waktu (YYYY-MM-DD HH:MM): ");
  String tenggatStr = stdin.readLineSync()!; // Membaca input tenggat waktu dari pengguna
  DateTime tenggat = DateTime.parse(tenggatStr.replaceFirst(" ", "T")); // Mengonversi string menjadi DateTime

  Tugas tugas = Tugas(judul, tenggat); // Membuat objek Tugas baru
  daftarTugas.add(tugas); // Menambahkan tugas baru ke dalam daftar
  quicksort(daftarTugas, 0, daftarTugas.length - 1); // Mengurutkan daftar tugas menggunakan quicksort
  print("Tugas berhasil ditambahkan!"); // Menampilkan pesan konfirmasi
}

// Fungsi untuk mengurutkan daftar tugas menggunakan algoritma quicksort
void quicksort(List<Tugas> list, int low, int high) {
  if (low < high) {
    int pivotIndex = partition(list, low, high); // Mempartisi daftar dan mendapatkan indeks pivot
    quicksort(list, low, pivotIndex - 1); // Rekursif untuk mengurutkan sub-daftar di kiri pivot
    quicksort(list, pivotIndex + 1, high); // Rekursif untuk mengurutkan sub-daftar di kanan pivot
  }
}

// Fungsi untuk mempartisi daftar berdasarkan pivot
int partition(List<Tugas> list, int low, int high) {
  DateTime pivot = list[high].tenggat; // Memilih elemen terakhir sebagai pivot
  int i = low - 1; // Inisialisasi indeks elemen yang lebih kecil dari pivot
  for (int j = low; j < high; j++) {
    if (list[j].tenggat.isBefore(pivot)) { // Jika elemen saat ini lebih kecil dari pivot
      i++;
      swap(list, i, j); // Menukar elemen
    }
  }
  swap(list, i + 1, high); // Menukar elemen pivot dengan elemen di posisi i+1
  return i + 1; // Mengembalikan indeks pivot
}

// Fungsi untuk menukar dua elemen dalam daftar
void swap(List<Tugas> list, int i, int j) {
  Tugas temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

// Fungsi untuk menampilkan semua tugas yang ada dalam daftar tugas
void lihatTugas(List<Tugas> daftarTugas) {
  if (daftarTugas.isEmpty) {
    print("Tidak ada tugas yang tersedia."); // Menampilkan pesan jika daftar tugas kosong
  } else {
    for (int i = 0; i < daftarTugas.length; i++) {
      print("${i + 1}. ${daftarTugas[i]}"); // Menampilkan setiap tugas dengan nomor urut
    }
  }
}

// Fungsi untuk menghapus tugas dari daftar berdasarkan nomor urut
void hapusTugas(List<Tugas> daftarTugas) {
  lihatTugas(daftarTugas); // Menampilkan daftar tugas agar pengguna bisa memilih
  if (daftarTugas.isNotEmpty) {
    print("Masukkan nomor tugas yang ingin dihapus: ");
    int noTugas = int.parse(stdin.readLineSync()!) - 1; // Membaca nomor tugas dari input pengguna
    if (noTugas >= 0 && noTugas < daftarTugas.length) {
      Tugas tugasDihapus = daftarTugas.removeAt(noTugas); // Menghapus tugas dari daftar
      print("Tugas '${tugasDihapus.judul}' berhasil dihapus!"); // Menampilkan pesan konfirmasi
    } else {
      print("Nomor tugas tidak valid."); // Menampilkan pesan jika nomor tugas tidak valid
    }
  }
}

// Fungsi untuk memperbarui status tugas menjadi selesai
void perbaruiStatusTugas(List<Tugas> daftarTugas) {
  lihatTugas(daftarTugas); // Menampilkan daftar tugas agar pengguna bisa memilih
  if (daftarTugas.isNotEmpty) {
    print("Masukkan nomor tugas yang ingin ditandai sebagai selesai: ");
    int noTugas = int.parse(stdin.readLineSync()!) - 1; // Membaca nomor tugas dari input pengguna
    if (noTugas >= 0 && noTugas < daftarTugas.length) {
      daftarTugas[noTugas].selesai = true; // Mengubah status tugas menjadi selesai
      print("Tugas '${daftarTugas[noTugas].judul}' ditandai sebagai selesai!"); // Menampilkan pesan konfirmasi
    } else {
      print("Nomor tugas tidak valid."); // Menampilkan pesan jika nomor tugas tidak valid
    }
  }
}

// Fungsi utama untuk menjalankan aplikasi
void main() {
  List<Tugas> daftarTugas = []; // Inisialisasi daftar tugas kosong
  while (true) {
    // Menampilkan menu pilihan kepada pengguna
    print("\nManajer Tugas");
    print("1. Tambah Tugas");
    print("2. Lihat Tugas");
    print("3. Hapus Tugas");
    print("4. Perbarui Status Tugas");
    print("5. Keluar");
    print("Masukkan pilihan Anda: ");
    String pilihan = stdin.readLineSync()!; // Membaca pilihan pengguna

    // Memproses pilihan pengguna menggunakan switch-case
    switch (pilihan) {
      case "1":
        tambahTugas(daftarTugas); // Memanggil fungsi tambahTugas
        break;
      case "2":
        lihatTugas(daftarTugas); // Memanggil fungsi lihatTugas
        break;
      case "3":
        hapusTugas(daftarTugas); // Memanggil fungsi hapusTugas
        break;
      case "4":
        perbaruiStatusTugas(daftarTugas); // Memanggil fungsi perbaruiStatusTugas
        break;
      case "5":
        print("Terima kasih telah menggunakan Manajer Tugas. Sampai jumpa!"); // Menampilkan pesan keluar
        return; // Keluar dari program
      default:
        print("Pilihan tidak valid, silakan coba lagi."); // Menampilkan pesan jika pilihan tidak valid
    }
  }
}
