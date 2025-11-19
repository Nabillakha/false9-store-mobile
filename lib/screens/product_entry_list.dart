import 'package:flutter/material.dart';
import 'package:false9_store/models/product_entry.dart';
import 'package:false9_store/widgets/left_drawer.dart';
import 'package:false9_store/screens/product_detail.dart';
import 'package:false9_store/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool filterByUser;

  const ProductEntryListPage({super.key, this.filterByUser = false});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    String url;

    if (widget.filterByUser) {
      // URL backend yang hanya mengirim produk milik user login
      url = 'http://localhost:8000/json/user-products/';
    } else {
      // URL semua produk
      url = 'http://localhost:8000/json/';
    }
    
    final response = await request.get(url);
    
    // Decode response to json format
    var data = response;
    
    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: request.loggedIn ? fetchProduct(request) : Future.value([]),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data.length == 0) {
              return const Center(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                    "No products available.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                    ),
                    ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: ()async {
                     // Navigate to product detail page
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                            product: snapshot.data![index],
                        ),
                        ),
                    );
                    // Refresh the state when returning from the detail page
                     setState(() {});

                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}