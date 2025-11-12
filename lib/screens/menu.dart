import 'package:flutter/material.dart';
import 'package:false9_store/widgets/left_drawer.dart';
import 'package:false9_store/screens/productlist_form.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Informasi pengguna
  final String nama = "Alya Nabilla Khamil";
  final String npm = "2406358094";
  final String kelas = "B";

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.store),
    ItemHomepage("My Products", Icons.shopping_bag),
    ItemHomepage("Add Product", Icons.add_box),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'False9 Store',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Row menampilkan InfoCard
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),
            const SizedBox(height: 16.0),
            const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Selamat datang di Football News',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
            const SizedBox(height: 16.0),
            // GridView harus dibungkus Expanded supaya tidak overflow
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: items.map((item) => ItemCard(item: item)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Versi sederhana InfoCard
class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu menekan tombol ${item.name}!")),
            );

          if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductFormPage()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30),
                const SizedBox(height: 3),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  ItemHomepage(this.name, this.icon);
}
