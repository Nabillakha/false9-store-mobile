import 'package:flutter/material.dart';
import 'package:false9_store/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:false9_store/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _description = "";
  String _category = "jersey"; // default
  String _thumbnail = "";
  bool _isFeatured = false;
  int _price = 0;
  int _stock = 0;

  final List<String> _categories = [
    'jersey',
    'boots',
    'training',
    'accessories',
    'ball',
    'lifestyle',
    'collectibles',
    'others'
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Form Tambah Produk")),
        backgroundColor: Colors.indigo,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Produk
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onChanged: (value) => _name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    if (value.length > 255) {
                      return "Nama produk maksimal 255 karakter!";
                    }
                    return null;
                  },
                ),
              ),
              // Harga
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Harga Produk",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _price = int.tryParse(value) ?? 0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    int? harga = int.tryParse(value);
                    if (harga == null || harga < 0) {
                      return "Harga harus berupa angka >= 0!";
                    }
                    return null;
                  },
                ),
              ),
              // Stock
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Stock Produk",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _stock = int.tryParse(value) ?? 0,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Stock tidak boleh kosong!";
                    }
                    int? stock = int.tryParse(value);
                    if (stock == null || stock < 0) {
                      return "Stock harus berupa angka >= 0!";
                    }
                    return null;
                  },
                ),
              ),
              // Deskripsi
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onChanged: (value) => _description = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Kategori
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  value: _category,
                  items: _categories
                      .map((c) => DropdownMenuItem(
                            value: c,
                            child: Text(c[0].toUpperCase() + c.substring(1)),
                          ))
                      .toList(),
                  onChanged: (value) => _category = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kategori harus dipilih!";
                    }
                    return null;
                  },
                ),
              ),
              // Thumbnail
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Thumbnail URL",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onChanged: (value) => _thumbnail = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Thumbnail wajib diisi!";
                    }
                    Uri? uri = Uri.tryParse(value);
                    if (uri == null || !uri.isAbsolute) {
                      return "Thumbnail harus berupa URL valid!";
                    }
                    return null;
                  },
                ),
              ),
              // Is Featured
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Produk Unggulan"),
                  value: _isFeatured,
                  onChanged: (value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ),
              // Save Button
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                         final response = await request.postJson(
                          "http://localhost:8000/create-flutter/",
                          jsonEncode({
                            "name": _name,
                            "description": _description,
                            "category": _category,
                            "thumbnail": _thumbnail,
                            "is_featured": _isFeatured,
                            "price": _price,
                            "stock": _stock,
                          }),
                        );
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("News successfully saved!"),
                            ));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Something went wrong, please try again."),
                            ));
                          }
                        }
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Produk berhasil disimpan"),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nama: $_name"),
                                  Text("Harga: $_price"),
                                  Text("Stock: $_stock"),
                                  Text("Deskripsi: $_description"),
                                  Text("Kategori: $_category"),
                                  Text("Thumbnail: $_thumbnail"),
                                  Text("Unggulan: ${_isFeatured ? "Ya" : "Tidak"}"),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _formKey.currentState!.reset();
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo)),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
