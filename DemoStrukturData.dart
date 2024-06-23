import 'dart:io';
import 'dart:collection'; // Import pustaka dart:collection untuk Queue

class Tugas {
  String nama;
  DateTime deadline;
  bool selesai;

  Tugas(this.nama, this.deadline, {this.selesai = false});

  void ubahStatusSelesai() {
    selesai = !selesai;
  }

  String toString() {
    var deadlineWIB = deadline.add(Duration(hours: 7));
    var deadlineStr = "${deadlineWIB.year.toString().padLeft(4, '0')}-"
                      "${deadlineWIB.month.toString().padLeft(2, '0')}-"
                      "${deadlineWIB.day.toString().padLeft(2, '0')} "
                      "${deadlineWIB.hour.toString().padLeft(2, '0')}:"
                      "${deadlineWIB.minute.toString().padLeft(2, '0')} WIB";
    return '[${selesai ? 'X' : ' '}] $nama (Deadline: $deadlineStr)';
  }
}

class PengelolaTugas {
  Queue<Tugas> antrianTugas = Queue<Tugas>(); // Menggunakan Queue untuk menyimpan tugas

  void tambahTugas(String nama, DateTime deadline) {
    var deadlineUTC = deadline.subtract(Duration(hours: 7));
    antrianTugas.add(Tugas(nama, deadlineUTC));
    // Tidak perlu mengurutkan, karena tugas ditambahkan sesuai urutan deadline
  }

  void ubahStatusTugas(int indeks) {
    // Implementasi sama seperti sebelumnya
  }

  void hapusTugas(int indeks) {
    // Implementasi sama seperti sebelumnya
  }

  void tampilkanTugas() {
    if (antrianTugas.isEmpty) {
      print('Belum ada tugas yang ditambahkan.');
    } else {
      var i = 0;
      for (var tugas in antrianTugas) {
        print('$i. $tugas');
        i++;
      }
    }
  }
}

void main() {
  final pengelolaTugas = PengelolaTugas();

  while (true) {
    print('Pengelola Tugas');
    print('1. Tambah Tugas');
    print('2. Ubah Status Penyelesaian Tugas');
    print('3. Hapus Tugas');
    print('4. Tampilkan Tugas');
    print('5. Keluar');
    stdout.write('Masukkan pilihan anda: ');
    var pilihan = int.tryParse(stdin.readLineSync() ?? '');

    switch (pilihan) {
      case 1:
        // Implementasi sama seperti sebelumnya
        break;
      case 2:
        // Implementasi sama seperti sebelumnya
        break;
      case 3:
        // Implementasi sama seperti sebelumnya
        break;
      case 4:
        // Implementasi sama seperti sebelumnya
        break;
      case 5:
        print('Keluar...');
        return;
      default:
        print('Pilihan tidak valid! Mohon masukkan angka antara 1 dan 5.');
    }

    print('\n');
  }
}
