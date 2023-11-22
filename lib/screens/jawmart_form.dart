import 'package:flutter/material.dart';
import 'package:jaw_mart/widgets/left_drawer.dart';
import 'package:jaw_mart/screens/jawmart_items.dart';
import 'dart:convert';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:jaw_mart/screens/menu.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _category="";
  int _amount = 0;
  String _effect="";
  String _description = "";
  DateTime _dateAdded = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nama Produk",
                      labelText: "Nama Produk",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Nama tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Harga",
                      labelText: "Harga",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // TODO: Tambahkan variabel yang sesuai
                    onChanged: (String? value) {
                      setState(() {
                        _price = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Harga tidak boleh kosong!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Harga harus berupa angka!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Deskripsi",
                      labelText: "Deskripsi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Deskripsi tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Kategori",
                      labelText: "Kategori",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _category = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Kategori tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Jumlah",
                      labelText: "Jumlah",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Jumlah tidak boleh kosong!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Jumlah harus berupa angka!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Efek",
                      labelText: "Efek",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    onChanged: (String? value) {
                      setState(() {
                        _effect = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Efek tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.indigo),
                      ),

                      onPressed: () async {

                        if (_formKey.currentState!.validate()) {
                          _dateAdded = DateTime.now();

                          //add object item
                          jawItems.add(JawItems(_name,_price,_category,_amount,_description,_description,
                              _dateAdded,Colors.blueAccent));

                          final response = await request.postJson(
                              "http://localhost:8000/create-flutter/",
                              jsonEncode(<String, String>{
                                'name': _name,
                                'amount': _amount.toString(),
                                'description': _description,
                                'effect' : _effect,
                                'category' : _category,
                                'dateAdded' : _dateAdded.toString(),

                              }));

                          if (response['status'] == 'success') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Produk baru berhasil disimpan!"),
                            ));
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                              Text("Terdapat kesalahan, silakan coba lagi."),
                            ));
                          }

                          // ignore: use_build_context_synchronously
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Produk berhasil tersimpan'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Nama: $_name'),
                                        Text('Amount: $_amount'),
                                        Text('Description: $_description'),
                                        Text('Effect: $_effect'),
                                        Text('Category: $_category'),
                                        Text('DateAdded: $_dateAdded'),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          );
                          _formKey.currentState!.reset();
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}