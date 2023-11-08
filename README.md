**Nama    : Zaim Aydin Nazif**
**Kelas   : F**
**NPM     : 2206082524**

TUGAS 7:

**Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**

1. Stateless Widget:
    - Tidak memiliki state internal sehingga ketika widget ini dibuat dan dirender pertama kali, properti atau tampilan dalam widget tidak dapat diubah (statis).
    - Cocok digunakan ketika kita ingin menampilkan data yang sama selama apps berjalan.

2. Stateful widget:
    - Memiliki state internal sehingga properti atau tampilan widget dapat berubah-ubah dengan cara merender ulang.
    - Cocok digunakan untuk widget yang akan digunakan untuk interaksi dengan pengguna 

**Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.**

widget pada`main.dart`:
    1. MyApp : root dari aplikasi yang menampung seluruh widget yang ada pada apps ini.
    2. MaterialApp : digunakan untuk mengatur konfigurasi global. aplikasi dan menyediakan kerangka kerja untuk membangun aplikasi.
    3. MyHomePage : merupakan widget halaman utama aplikasi.

widget pada `menu.dart`:
    1. Scaffold : menyediakan struktur dasar untuk tampilan halaman.
    2. AppBar : menampilkan header atas aplikasi dengan judul.
    3. SingleChildScrollView : memungkinkan untuk melakukan scrolling pada konten
    4. Padding : menambahkan padding konten
    5. Column : mengatur posisi children widget secara vertikal.
    6. Text : menampilkan teks dengan gaya tertentu.
    7. GridView.count : digunakan untuk mengatur tampilan berupa grid layout.
    8. ShopCard : menampilkan card tombol View Item, Add Item, dan Logout.
    9. Material : digunakan untuk mengatur warna latar belakang dan tampilan dasar untuk card.
    10. InkWell : memungkinkan area card menjadi responsif terhadap sentuhan pengguna, sehingga dapat mendeteksi ketika card ditekan.
    11. Container : digunakan untuk mengatur struktur konten dalam kotak dengan padding yang telah ditentukan.
    12. Center : mengatur konten agar tepat di tengah card.
    13. Icon : widget untuk menampilkan icon tertentu.
    14. SnackBar : digunakan untuk menampilkan pesan pada pengguna.

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)**

1. Membuat project flutter dengan menggunakan perintah pada direktori yang telah dipilih
    ```
    flutter create jaw_mart
    ```
    kemudian membuat file bernama `menu.dart` pada direktori `jaw_mart/lib` dan mengimport package  `material.dart` dari flutter. Kemudian memindahkan class MyHomePage dan _MyHomePageState pada `main.dart` ke `menu.dart`. Kemudian menginmport `menu.dart` pada `main.dart`.

2. Membuat 3 tombol sederhana

    Untuk membuat tiga tombol sederhana, saya terlebih dahulu mengubah warna tema aplikasi menjadi Indigo. Kemudian pada class MyHomePage di main.dart, saya menghapus MyHomePage(title: 'Flutter Demo Home Page'). Pada menu.dart, saya mengubah state menjadi stateless agar statis dan meningkatkan performa aplikasi. Saya juga melakukan perubahan pada bagian ({super.key, required this.title}) menjadi ({Key? key}) : super(key: key);. Setelah itu, saya menghapus kode pada class tersebut dari final string title hingga kebawah. Untuk membuat objek informasi itemnya, saya membuat class ShopItem yang memiliki atribut nama dan icon.pada class MyHomePage, saya menambahkan kode berikut untuk menampilkan card pada halaman utama.

    ```dart
    final List<ShopItem> items = [
        ShopItem("View Item", Icons.checklist, Colors.blue),
        ShopItem("Add Item", Icons.add_circle, Colors.orangeAccent),
        ShopItem("Logout", Icons.logout, Colors.red),
    ];
    ```
    Kemudian saya membuat AppBar, dan membuat agar tampilan pada isi halaman page dapat di scroll serta membuat agar card yang ditampilkan tertata dengan rapi menggunakan GridView. Lalu saya juga membuat class baru bernama ShopCard untuk meletakkan ShopItem dengan card. Pada kelas tersebut, terdapat atribut ShopItem dan memiliki widget-widget yang dibutuhkan untuk membentuk sebuah card.

3. Menambahkan snackbar

    menambahkan state onTap agar ketika card ditekan akan memunculkan snackbar dengan menggunakan perintah dibawah ini dalam InkWell:

    ```dart
    InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
    )
    
    ```

