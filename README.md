**Nama    : Zaim Aydin Nazif**
**Kelas   : F**
**NPM     : 2206082524**

TUGAS 8:

**Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!**

`Navigator.push()` menimpa tampilan sebelumnya dengan tampilan baru, sedangkan `Navigator.pushReplacement()` mengganti tampilan sebelumnya dengan tampilan baru tanpa mengubah jumlah rute pada stack flutter. 

`Navigator.push()` cocok digunakan ketika developer ingin mempertahankan halaman awalnya ketika ingin menampilkan halaman baru. Developer dapat menambahkan potongan kode `Navigator.pop()` untuk kembali ke halaman yang ditimpa.

`Navigator.pushReplacement()` cocok digunakan ketika developer tidak ingin mempertahankan halaman awalanya ketika ingin menampilkan halaman baru.


**Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!**

1. Container : digunakan untuk menempatkan widget lain dan memberikan kontrol terhadap padding, margin, background color, border, dan lain-lain.

2. Row : digunakan untuk menyusun widget secara horizontal (ke samping).

3. Column : digunakan untuk menyusun widget secara vertikal.

4. ListView : digunakan untuk membuat daftar yang dapat di scroll dari widget. Berguna ketika aplikasi memiliki daftar item atau komponen yang melebihi ukuran layar.

5. GridView : digunakan untuk menampilkan daftar item dalam bentuk grid. 

6. Stack : digunakan untuk menyusun widget diatas satu sama lain (tumpukan).

7. Expanded / Flekxible : digunakan untuk mengisi ruang kosong yang tersisa dalan widget induk.

8. SizedBox : digunakan untuk membuat kotak kosong dengan ukuran tertentu. Berguna untuk memberikan jarak antara widget-widget

9. Wrap : digunakan untuk menyusun widget ke dalam baris dan kolom, serupa dengan Row dan Column, tetapi dengan fitur wrap

10. Card : digunakan untuk mengelompokkan widget-widget dalam sebuah kartu. Berguna untuk menyajikan informasi atau fungsi terkait sebagai satu unit yang terpisah.

11. Align : digunakan untuk menempatkan widget ke posisi tertentu dalam parent widget.

12. Positioned : digunakan untuk memberikan lebih banyak kontrol terhadap posisi dan ukuran widget dalam parent daripada Align

13. AspectRatio : digunakan untuk memastikan bahwa widget memiliki aspect ratio tertentu.


**Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!**

1. Form : digunakan untuk mengatur dan mem-validasi input nama barang, jumlah barang, deskripsi, efek, kategori, dan harga barang.

2. TextFormField : digunakan untuk input field data barang melalui sebuah text field.


**Bagaimana penerapan clean architecture pada aplikasi Flutter?**

Berikut adalah penerapan flutter clean architecture:

```
lib/
    app/                          <--- application layer
        pages/                        <-- pages or screens
          login/                        <-- some page in the app
            login_controller.dart         <-- login controller extends `Controller`
            login_presenter.dart          <-- login presenter extends `Presenter`
            login_view.dart               <-- login view, 2 classes extend `View` and `ViewState` resp.
        widgets/                      <-- custom widgets
        utils/                        <-- utility functions/classes/constants
        navigator.dart                <-- optional application navigator
    data/                         <--- data layer
        repositories/                 <-- repositories (retrieve data, heavy processing etc..)
          data_auth_repo.dart           <-- example repo: handles all authentication
        helpers/                      <-- any helpers e.g. http helper
        constants.dart                <-- constants such as API keys, routes, urls, etc..
    device/                       <--- device layer
        repositories/                 <--- repositories that communicate with the platform e.g. GPS
        utils/                        <--- any utility classes/functions
    domain/                       <--- domain layer (business and enterprise) PURE DART
        entities/                   <--- enterprise entities (core classes of the app)
          user.dart                   <-- example entity
          manager.dart                <-- example entity
        usecases/                   <--- business processes e.g. Login, Logout, GetUser, etc..
          login_usecase.dart          <-- example usecase extends `UseCase` or `CompletableUseCase`
        repositories/               <--- abstract classes that define functionality for data and device layers
    main.dart                     <--- entry point
```

sumber : https://pub.dev/packages/flutter_clean_architecture


**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)**

- Membuat halaman formulir:
    1. Membuat file dart baru bernama `jawmart_from.dart` yang digunakan untuk halaman form. Kemudian membuat 2 kelas yaitu ShopFormPage yang digunakan untuk menampilkan halaman formulir dan _ShopFormPage untuk mengelola tampilan halaman formulir.

    2. Menambahkan field form pada kelas ShopFormPage sesuai field yang dimiliki item pada tugas django.

    3. membuat widget Scaffold untuk membuat template form pada method build di _ShopFormPage. Membuat objek form untuk menangani formulir dengan validasi dan mengelompokkan elemen-elemen input menggunakan TextFormField

    4. Membuat tombol save dengan menggunakan widget Elevated Button.

- Mengarahkan user ke halaman form:
    Menambahkan conditional pada `shop_card.dart` yang akan merespon ketika card ditekan melalui fungsi onTap(). Ketika nama dari card tersebut adalah "Add Item" maka user akan dipindahkan ke halaman form menggunakan `Navigator.pushReplacement()`

- Memunculkan data sesuai dengan isi formulir:
    Menambahkan method showDialog pada ElevatedButton pada `jawmart_form.dart` agar ketika form telah divalidasi dapat memunculkan data sesuai dengan inputan dari user.

- Membuat drawer:
    1. Membuat file dart baru bernama `left_drawer.dart` untuk menampilkan drawer pada aplikasi. Di dalam program tersebut, buat class baru bernama "LeftDrawer" yang bersifat stateless.

    2. Membuat ListView dan menambhakan ListTile yang diperlukan (Halaman utama dan form).

    3. Menambahkan rute yang sesuai pada ListView menggunakan `Navigator.pushReplacement()`


