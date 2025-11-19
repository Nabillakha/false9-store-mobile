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

## TUGAS 8

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

## TUGAS 9

### 1. Mengapa perlu membuat model Dart saat mengambil/mengirim data JSON

Membuat model Dart (misal `ProductEntry`) penting karena:

* Memastikan **validasi tipe data**: setiap field punya tipe yang jelas (String, int, double, dll).
* Mendukung **null-safety**: field yang nullable bisa ditangani dengan aman.
* Mempermudah **maintainability**: perubahan struktur JSON lebih mudah dikelola melalui model dibanding memetakan Map langsung.

Jika langsung menggunakan `Map<String, dynamic>` tanpa model:

* Risiko **salah tipe** lebih tinggi (misal JSON mengirim angka tapi diakses sebagai String).
* **Null-safety tidak terjamin**, bisa terjadi runtime error.
* Kode jadi **kurang rapi dan susah di-maintain** karena pemetaan dan parsing dilakukan berulang kali di berbagai tempat.


### 2. Fungsi package http dan CookieRequest

* **http**
  Digunakan untuk melakukan request HTTP standar (GET, POST, PUT, DELETE) tanpa otomatis menyimpan session/cookie. Cocok untuk request stateless.

* **CookieRequest (package pbp_django_auth)**
  Memudahkan komunikasi dengan backend Django yang menggunakan session/cookie. Otomatis menyimpan cookie login, CSRF token, dan mengirimnya di request berikutnya.

**Perbedaan utama:**
http = stateless, manual handle cookie
CookieRequest = stateful, otomatis manage cookie & session


### 3. Mengapa instance CookieRequest perlu dibagikan ke semua komponen Flutter

* Agar **session login** tetap konsisten di seluruh halaman.
* Menghindari pengguna harus login ulang saat pindah halaman.
* Memastikan semua request yang butuh autentikasi menggunakan **cookie yang sama**.

Biasanya dilakukan dengan **Provider** supaya instance dapat diakses di seluruh widget tree.


### 4. Konfigurasi konektivitas Flutter – Django

Agar Flutter dapat berkomunikasi dengan Django:

* **10.0.2.2 pada ALLOWED_HOSTS**
  Untuk mengakses localhost Django dari Android emulator. Tanpa ini, request akan ditolak karena host tidak valid.

* **Mengaktifkan CORS**
  Agar aplikasi Flutter (running di device/emulator) bisa mengakses backend dari domain berbeda.

* **Pengaturan SameSite & cookie**
  Agar cookie login/session dapat dikirim ke Flutter secara benar.

* **Menambahkan izin akses internet di AndroidManifest.xml**
  Agar aplikasi Flutter bisa melakukan request HTTP.

Jika salah konfigurasi:

* Request bisa **ditolak (403/500)**
* Cookie/login **tidak tersimpan**
* Data tidak muncul di aplikasi

### 5. Mekanisme pengiriman data dari input hingga tampil di Flutter

1. Pengguna mengisi form di Flutter.
2. Data diambil oleh widget dan diubah ke JSON.
3. JSON dikirim ke Django melalui POST request (http atau CookieRequest).
4. Django menerima request, menyimpan/validasi data di database.
5. Django mengirim JSON response balik ke Flutter.
6. Flutter menerima JSON dan **mem-parsing** ke model Dart.
7. Data model ditampilkan di UI (misal ListView atau Card).

### 6. Mekanisme autentikasi (login, register, logout)

1. **Register**

   * Pengguna input username, email, password di Flutter.
   * Data dikirim POST ke endpoint Django `/auth/register/`.
   * Django memvalidasi & menyimpan user di database.
   * Response sukses dikirim balik ke Flutter.

2. **Login**

   * Pengguna input username & password.
   * CookieRequest mengirim POST ke `/auth/login/`.
   * Django memverifikasi, membuat session & cookie, mengirim response.
   * Flutter menyimpan cookie secara otomatis di CookieRequest.

3. **Logout**

   * Flutter memanggil endpoint `/auth/logout/` via CookieRequest.
   * Django menghapus session & cookie.
   * Flutter mengupdate state dan mengarahkan ke halaman login.

Dengan mekanisme ini, setiap halaman Flutter yang butuh autentikasi **otomatis memanfaatkan session yang sama** tanpa login ulang.

### 7. Implementasi Checklist Proyek False9 Store

Implementasi ini mencakup autentikasi (register & login), model produk, pengambilan & tampilan data, serta halaman detail.


- ### I. Persiapan Proyek Django & Model Kustom

1. **Deployment Django**
   Pastikan Django sudah berjalan dan endpoint JSON (`/json/`) dapat diakses (misal di Heroku atau localhost).

2. **Membuat Model Produk di Django**
   Model `Product` memiliki field: `name`, `price`, `description`, `thumbnail`, `category`, `is_featured`, `user`.
   Pastikan view JSON menampilkan data dari model ini.

3. **Membuat Model Dart di Flutter**

   * Ambil data JSON dari endpoint Django.
   * Gunakan Quicktype untuk generate class Dart (`product_entry.dart`).
   * Simpan di `lib/models/`.

- ### II. Integrasi Autentikasi

1. **Setup Django Authentication & CORS**

   * Tambahkan aplikasi `authentication` dan `corsheaders`.
   * Konfigurasi `ALLOWED_HOSTS`, `CORS_ALLOW_ALL_ORIGINS`, `SESSION/CSRF cookies`, dan `10.0.2.2` untuk emulator.

2. **Login & Register Django Views**

   * `login/` → authenticate & buat session, return JsonResponse.
   * `register/` → create user baru dengan validasi password & username.
   * Tambahkan URL routing di `authentication/urls.py` dan include di `project/urls.py`.

3. **Integrasi Flutter**

   * Tambahkan dependency: `provider`, `pbp_django_auth`.
   * Wrap `MaterialApp` dengan `Provider` untuk menyebarkan `CookieRequest` ke seluruh aplikasi.

4. **Halaman Login & Register Flutter**

   * LoginPage: form username & password → request.login() → navigasi ke `MyHomePage`.
   * RegisterPage: form username, password, confirm password → request.postJson() → navigasi kembali ke LoginPage.
   * Link dari LoginPage ke RegisterPage dengan GestureDetector.


- ### III. Pengambilan & Tampilan Data Produk

1. **Daftar Produk**

   * Package `http` untuk request; izin internet di AndroidManifest.xml.
   * Buat widget `ProductEntryCard` menampilkan: `name`, `price`, `description`, `thumbnail`, `category`, `is_featured`.
   * Gunakan FutureBuilder di `ProductEntryListPage` untuk menampilkan list produk.

2. **Detail Produk**

   * `ProductDetailPage` menerima `Product` sebagai parameter.
   * Tampilkan semua atribut.
   * Navigasi dari card dengan `Navigator.push()`.
   * Tambahkan tombol back otomatis via AppBar.

3. **Filter Produk User**

   * Endpoint Django `/json/user-products/` hanya mengembalikan produk milik user login.
   * Flutter memanggil endpoint ini menggunakan `CookieRequest`.
   * FutureBuilder menampilkan list produk user yang sudah terfilter.


- ### IV. Mekanisme Data & Autentikasi

1. **Alur Data**

```text
[Input Flutter Form] → JSON → POST ke Django → Simpan DB → Response JSON → Parse ke Product Model → Tampil di UI
```

2. **Alur Autentikasi**

```text
REGISTER:
Flutter → POST /auth/register/ → Django create user → Response → Flutter navigasi ke Login

LOGIN:
Flutter → POST /auth/login/ → Django verify → Buat session & cookie → Response → Flutter simpan cookie → Navigasi ke Home

LOGOUT:
Flutter → GET /auth/logout/ → Django hapus session → Flutter navigasi ke Login
```


---