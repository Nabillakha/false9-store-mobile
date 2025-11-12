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

## TUGAS 2

### 1. Perbedaan Navigator.push() dan Navigator.pushReplacement()
Di Flutter, navigasi halaman dilakukan dengan **Navigator**. Ada dua cara penting:

- **Navigator.push()** menambahkan halaman baru ke stack navigasi tanpa menghapus halaman sebelumnya.  
  Halaman lama tetap ada, sehingga pengguna bisa kembali dengan tombol back.  
  Contoh penggunaan di Football Shop: ketika membuka halaman form tambah produk (`Add Product`) tapi pengguna tetap bisa kembali ke halaman utama.

  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProductFormPage()),
  );
- **Navigator.pushReplacement()** mengganti halaman saat ini dengan halaman baru, halaman lama dihapus dari stack.
  Tidak bisa kembali ke halaman sebelumnya.
  Contoh penggunaan: setelah login berhasil, langsung ke halaman utama tanpa bisa kembali ke halaman login.

    ```dart
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
    ```
Kita dapat pakai push() jika pengguna perlu kembali ke halaman sebelumnya, dan pushReplacement() jika halaman lama tidak perlu dikunjungi lagi.

### 2. Memanfaatkan Hierarchy Widget (Scaffold, AppBar, Drawer)
Di Flutter, setiap elemen UI adalah widget, dan semua widget tersusun dalam widget tree yang membentuk hubungan parent-child.
Untuk membangun halaman yang konsisten di Football Shop, saya memanfaatkan beberapa widget inti:

- **Scaffold**
    
    Scaffold bertindak sebagai kerangka dasar halaman. Ia menyediakan area untuk AppBar, body, dan drawer. Dengan Scaffold, saya bisa memastikan semua halaman memiliki struktur seragam, misalnya setiap halaman punya AppBar di atas, konten utama di tengah, dan drawer di samping.

- **AppBar**
    
    AppBar digunakan untuk menampilkan judul halaman dan bisa menambahkan tombol aksi seperti icon atau menu. Dengan menempatkan AppBar di setiap halaman, pengguna selalu tahu di halaman mana mereka berada. Misalnya, di halaman utama tertulis "False9 Store", sedangkan di halaman tambah produk tertulis "Form Tambah Produk".

- **Drawer**
    
    Drawer adalah menu samping yang muncul ketika pengguna menekan ikon hamburger di AppBar. Semua halaman menggunakan Drawer yang sama, sehingga navigasi antarhalaman menjadi konsisten. Pengguna bisa dengan mudah pindah dari halaman utama ke halaman produk, profile, atau menu lainnya tanpa kebingungan.

Dengan kombinasi ini, setiap halaman memiliki struktur konsisten dan rapi sehingga mudah digunakan oleh pengguna.

### 3. Kelebihan Layout Widget untuk Form
Layout widget membuat tampilan form:

- Rapi, karena jarak antar elemen jelas

- Responsif, karena bisa scroll jika layar kecil

- Mudah dibaca

Untuk menampilkan form atau elemen yang panjang dan banyak, Flutter menyediakan beberapa layout widget yang sangat membantu:

- **Padding**

    Memberikan jarak antar elemen agar tampilan tidak menempel di tepi layar dan lebih rapi.
Contoh:

    ```dart
    ...
    Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
            decoration: InputDecoration(
            labelText: "Nama Produk",
            border: OutlineInputBorder(),
            ),
        ),
    )
    ...
    ```

- **SingleChildScrollView**

    Agar halaman form yang panjang bisa di-scroll, mencegah elemen tersembunyi di layar kecil.
Contoh:

    ```dart
    ...
    SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
            children: [
            // Semua input form
            ],
        ),
    )
    ...
    ```

- **ListView**  

    Digunakan untuk menampilkan daftar widget yang bisa di-scroll secara vertikal.  
  Contoh:  
  ```dart
    ...
    ListView(
        children: [
        const DrawerHeader(...),
        ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () { ... },
        ),
        ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add Product'),
            onTap: () { ... },
        ),
        ],
    )
    ...
  ```



### 4. Menyesuaikan Warna Tema Aplikasi
Untuk identitas brand, saya menggunakan theme:

- primary color sebagai warna utama toko

- secondary color sebagai warna aksen

Semua halaman mengikuti tema ini sehingga tampilan aplikasi konsisten dan mudah dikenali.

Contoh:
```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      secondary: Colors.amber,
    ),
  ),
  home: MyHomePage(),
)
```

---