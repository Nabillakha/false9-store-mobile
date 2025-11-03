# false9_store

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

# README.md TUGAS

## TUGAS 7
### 1. Widget Tree dan Hubungan Parent-Child
**Widget tree** adalah struktur hierarki(seperti pohon) yang menggambarkan bagaimana semua elemen UI tersusun di aplikasi Flutter.  
Setiap widget adalah node dalam pohon, dan Flutter menggunakan struktur ini untuk menentukan ukuran, posisi, dan tampilan widget di layar. 
Setiap aplikasi Flutter memilki satu root widget, dan root widget ini memiliki satu atau lebih child widget. Setiap Child juga dapat memilki child lain, sehingga membentuk struktur seperti pohon.

Hubungan **parent-child** berarti:
- **Parent widget** membungkus dan memberi batasan (constraints) pada **child widget**.
- **Child widget** menyesuaikan diri dengan batasan tersebut dan mengembalikan ukurannya ke parent.  

Prinsip yang digunakan: _“Constraints go down, sizes go up, parent sets position.”_

artinya : constraint dari parent ke child, dan untuk ukuran child memberi tahu ukuran yang diinginkan ke parent. Posisi ditentukan oleh parent.


### 2. Widget yang Digunakan dan Fungsinya
Beberapa widget yang digunakan dalam proyek ini antara lain:
- **MaterialApp** : Sebagai root widget yang menyediakan tema, dan struktur dasar aplikasi.  
- **Scaffold** : Menyediakan struktur dasa halaman seperti `AppBar`, `Body`.  
- **AppBar** : Menampilkan bagian atas yang berisi judul. 
- **Padding** :  Memberikan jarak (spasi) di sekitar widget child-nya agar tampilan tidak terlalu menempel di tepi layar.  
- **Column** : Menyusun widget child secara **vertikal** (dari atas ke bawah). Digunakan untuk menata elemen seperti `InfoCard`, teks sambutan, dan grid item.
- **Row** : Menyusun widget secara horizontal, digunakan untuk menampilkan tiga `InfoCard` sejajar. 
- **SizedBox** : Menyediakan jarak kosong (spacer) antar elemen UI dengan ukuran 16 unit.
- **Center** : Menempatkan widget child tepat di tengah area yang tersedia.
- **Card** : Membungkus konten dalam bentuk kotak dengan efek bayangan (elevation). Dipakai untuk menampilkan informasi seperti `NPM`, `Name`, dan `Class`.
- **Container** : Widget serbaguna yang bisa digunakan untuk mengatur ukuran, padding, dan dekorasi, digunakan di dalam `Card` dan `ItemCard` untuk mengatur tata letak isi.
- **Text** : Menampilkan tulisan atau label di layar. Digunakan untuk menampilkan nama, NPM, kelas, dan teks sambutan.
- **GridView.count** : Menyusun widget dalam bentuk grid dengan 3 kolom, digunakan untuk menampilkan daftar item seperti “All Products”, “My Products”, dan “Create Products”.
- **Material** : Memberikan efek material design seperti warna latar, bentuk sudut, dan interaksi. Digunakan di dalam `ItemCard` untuk membungkus tampilan setiap kartu produk.
- **InkWell** : Mengatasi interaksi sentuhan seperti klik atau tap, digunakan untuk menampilkan **SnackBar** ketika pengguna menekan salah satu kartu produk.
- **SnackBar** : Menampilkan pesan notifikasi sementara di bagian bawah layar, digunakan untuk memberi respons saat tombol ditekan.
- **Icon** : Menampilkan ikon visual dari kumpulan ikon Material.
- **Padding (dalam Text dan Column)** : Digunakan juga untuk memberi jarak di dalam elemen seperti teks sambutan dan grid item agar tampilan lebih rapi.
- **InfoCard** : Widget yang menampilkan informasi berupa **title** dan **content**. dibungkus dengan `Card` dan `Container`.
- **ItemCard** : Widget yang menampilkan **ikon dan nama produk** dalam card berwarna.


### 3. Fungsi MaterialApp
`MaterialApp` berfungsi sebagai kerangka utama aplikasi Flutter.  
Widget ini mengatur tema, routing (navigasi antar halaman), dan teks default.  
`MaterialApp` sering digunakan sebagai root widget karena menjadi titik awal yang menyediakan seluruh elemen desain dan perilaku khas Android (Material Design).


### 4. StatelessWidget vs StatefulWidget
- **StatelessWidget** : cirinya tidak memiliki state (keadaan tetap) , digunakan Jika tampilan tidak berubah, misalnya teks statis atau ikon.
- **StatefulWidget** : cirinya memiliki state yang dapat berubah . Digunakan Jika tampilan perlu diperbarui, misalnya input pengguna, animasi, atau counter.


### 5. BuildContext
`BuildContext` adalah objek yang menyimpan **informasi posisi widget dalam widget tree**.  
Objek ini penting karena digunakan untuk:
- Mengakses **theme**, **navigator**, atau **media query**.
- Menentukan posisi relatif widget terhadap widget lain.

Di dalam metode `build()`, `BuildContext` membantu Flutter mengetahui di mana widget berada dalam tree dan bagaimana ia berinteraksi dengan parent-nya.


### 6. Hot Reload vs Hot Restart
- **Hot Reload** : Memperbarui kode dan UI **tanpa menghapus state** aplikasi. Cocok untuk melihat perubahan tampilan dengan cepat.  
- **Hot Restart** : Memulai ulang seluruh aplikasi **dari awal** dan **menghapus semua state**. Digunakan jika ada perubahan besar pada struktur awal widget atau variabel global.

Perbedaan utama antara Hot Reload dan Hot Restart terletak pada cara keduanya memperbarui aplikasi saat pengembangan. Hot Reload hanya memuat ulang bagian kode yang berubah tanpa menghapus data atau status yang sedang berjalan, sehingga prosesnya lebih cepat dan efisien untuk melihat hasil perubahan UI secara langsung. Sebaliknya, Hot Restart menjalankan ulang seluruh aplikasi dari awal, termasuk menginisialisasi kembali semua variabel dan menghapus state yang ada. Karena itu, Hot Reload lebih cocok digunakan untuk penyesuaian tampilan kecil atau logika lokal, sedangkan Hot Restart digunakan ketika terjadi perubahan signifikan pada struktur atau konfigurasi aplikasi.

---