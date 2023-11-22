**Nama    : Zaim Aydin Nazif**
**Kelas   : F**
**NPM     : 2206082524**

TUGAS 9:

**Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**

Bisa. Cara tersebut dapat digunakan ketika kita ingin mengelola data yang dinamis atau tidak terstruktur. Cara tersebut cocok apabila digunakan untuk proyek flutter sederhana tetapi tidak disarankan untuk diimplementasikan untuk proyek flutter yang memerlukan struktur data yang kompleks.

Menggunakan model untuk pengambilan data JSON menurut saya lebih baik diimplementasikan daripada tidak menggunakan model karena dengan mengimplementasi model kita dapat memiliki objek yang terstruktur. Selain itu penggunaan model juga akan memudahkan kita nantinya bila proyek flutter menjadi lebih kompleks.

**Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**

CookieRequest adalah sebuah class yang mengelola operasi terkait cookie dalam request HTTP pada aplikasi berbasis flutter. Fungsinya adalah untuk memanajemen cookie, pemeliharaan sesi, autentikasi, dan penyesuaian preferensi pengguna.

**Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.**

1. Menambahkan dependensi http pada proyek dengan menjalankan perintah `flutter pub add http`

2. Membuat model sesuai dengan respons dari data yang berasal dari webservice tersebut

3. membuat http request ke web service yang menggunakan dependensi http

4. Mengkonversikan objek yang telah didapatkan dari web service ke dalam model aplikasi flutter

5. Menampilkan data yang telah dikonversi dengan menggunakan FutureBuilder

6. Mem-*fetch* JSON sesuai dengan url

7. JSON yang telah di fetch akan disesuaikan bodynya menuju model Item sesuai dengan properti-properti yang ada

**Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**

1. User memasukkan username dan password

2. Aplikasi flutter akan mengirimkan HTTP Post ke fungsi login yang ada pada aplikasi authentication yang ada pada proyek berbasis Django menggunakan CookieRequest. Data username dan password akan dikirimkan sebagai bagian dari body request.

3. Django mengelola permintaan login dengan memverifikasi kredensial username dan password untuk menentukan kevalidan. Setelahnya, Django mengirimkan respons yang kemudian diakses dan diperiksa oleh aplikasi Flutter. Jika login sukses, ditandai dengan request.loggedIn bernilai true, aplikasi akan melakukan navigasi ke halaman MyHomePage dan menampilkan pesan selamat datang. Di sisi lain, jika proses login mengalami kegagalan, aplikasi akan menampilkan pesan kesalahan sebagai respons.

**Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**

1. AlertDialog : menampilkan pesan peringatan.
2. TextButton : menampilkan button dengan text.
3. TextField : digunakan untuk menerima input text dari user.
4. InputDecoration : untuk mendefinisikan penampildan dan style dari TextField
5. SizedBox : memberikan jarak antar widget.
6. ElevatedButton : menampilkan tombol
7. Navigator : memindahkan halaman.
8. MaterialPageRoute : untuk menyediakan efek transisi saat berpindah antar halaman.
9. CircularProgressIndicator : untuk menampilkan indikator loading.
10. ListView.builder : untuk membuat list yang efisien dengan item yang di-build saat mereka diputar ke dalam tampilan.
11. FutureBuilder : untuk membuat widget berdasarkan hasil Future, pada tugas ini dugunakan untuk membangun ListView berdasarkan hasil dari fetchItem().
12. Provider : untuk menyediakan objek yang dapat dibaca oleh widget lain yang berada di bawahnya di widget tree, pada tugas ini digunakan untuk menyediakan instance CookieRequest ke widget lain.
13. ScaffoldMessenger : untuk menampilkan SnackBar

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**

1. Membuat halaman login pada aplikasi flutter 

    Pertama-tama, saya melakukan instalasi package provider dan pbp_django_auth kemudian pada main.dart saya menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider. Kemudian saya membuat berkas login.dart yang berisi kode berikut.

    ```dart
    import 'package:jaw_mart/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
    runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        );
    }
    }

    class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    // ignore: library_private_types_in_public_api
    _LoginPageState createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
        appBar: AppBar(
            title: const Text('Login'),
        ),
        body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    labelText: 'Username',
                ),
                ),
                const SizedBox(height: 12.0),
                TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: 'Password',
                ),
                obscureText: true,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                onPressed: () async {
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    // Cek kredensial
                    // Untuk menyambungkan Android emulator dengan Django pada localhost,
                    // gunakan URL http://10.0.2.2/

                    // final response = await request.login("https://zaim-aydin-tugas.pbp.cs.ui.ac.id/auth/login/", {
                    // 'username': username,
                    // 'password': password,
                    // });

                    final response = await request.login("http://localhost:8000/auth/login/", {
                    'username': username,
                    'password': password,
                    });

                    if (request.loggedIn) {
                    String message = response['message'];
                    String uname = response['username'];
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                    } else {
                    // ignore: use_build_context_synchronously
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                        title: const Text('Login Gagal'),
                        content:
                        Text(response['message']),
                        actions: [
                            TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                                Navigator.pop(context);
                            },
                            ),
                        ],
                        ),
                    );
                    }
                },
                child: const Text('Login'),
                ),
            ],
            ),
        ),
        );
    }
    }
    ```

    2.Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

        1. Pertama-tama, saya membuat aplikasi django baru bernama authentication dan mengintall library dango-cors-headers dan menambahkan middleware nya. Kemudian saya melakukan konfigurasi terkait Cookie dan corsheaders pada settings.py.

        2. Kemudian saya membuat fungsi login dan logout pada authentication/views.py dan memanfaatkan @csrtf_excempt pada setiap fungsinya serta routing terhadap urls.py. Pengiriman data login dan logout dilakukan dengan memanfaatkan JsonResponse ke Flutter.

    3. Membuat model kustom sesuai dengan proyek aplikasi Django.

    Dalam membaut model kustom, saya memanfaatkan platform Quicktype yang dapat langsung melakukan konfigurasi model berdasarkan data json. Kemudian hasil konfigurasi model tersebut saya masukkan ke file `jawitem.dart` pada direktori `lib/models.`

    4. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.

        1. Sebelum membuat halaman daftar item, saya menginstall flutter http dan menambahkan `&lt;uses-permission android:name="android.permission.INTERNET" />` pada berkas android/app/src/main/AndroidManifest.xml.

        2. membuat file dart baru pada lib/screens bernama list_product.dart dengan isi:

        ```dart
        import 'package:flutter/material.dart';
        import 'package:http/http.dart' as http;
        import 'dart:convert';
        import 'package:jaw_mart/models/jawitems.dart';
        import 'package:jaw_mart/widgets/left_drawer.dart';

        class ProductPage extends StatefulWidget {
        const ProductPage({Key? key}) : super(key: key);

        @override
        _ProductPageState createState() => _ProductPageState();
        }

        class _ProductPageState extends State<ProductPage> {
        Future<List<Product>> fetchProduct() async {
            var url = Uri.parse(
                'http://localhost:8000/json/');
            var response = await http.get(
            url,
            headers: {"Content-Type": "application/json"},
            );

            // melakukan decode response menjadi bentuk json
            var data = jsonDecode(utf8.decode(response.bodyBytes));

            // melakukan konversi data json menjadi object Product
            List<Product> list_product = [];
            for (var d in data) {
            if (d != null) {
                list_product.add(Product.fromJson(d));
            }
            }
            return list_product;
        }

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                title: const Text('Product'),
                ),
                drawer: const LeftDrawer(),
                body: FutureBuilder(
                    future: fetchProduct(),
                    builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    } else {
                        if (!snapshot.hasData) {
                        return const Column(
                            children: [
                            Text(
                                "Tidak ada data produk.",
                                style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                            ],
                        );
                        } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.ammount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.category}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.effect}"),

                                ],
                                ),
                            ));
                        }
                    }
                    }));
        }
        }
        ```

        3. Kemudian saya menambahkan page daftar item ini ke left drawer pada left_drawer.dart dan mengaktifkan tombol Daftar Item pada main.dart agar melakukan navigasi ke halaman daftar item.

        4. Kemudian, saya melakukan integrasi form pada Flutter dengan Django app dengan menambahkan fungsi yang menerima data json dari form flutter dan membentuk objek Item berdasarkan data yang dikirim. Kemudian memanfaatkan CookieRequest pada form flutter yang sudah dibuat sebelumnya dan menambahkan asynchronous pada button form.


