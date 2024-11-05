import 'package:app_uts/profil.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Menghilangkan efek bayangan pada AppBar
        title: const Text(
          'Flowerest',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Color(0xFFDE302F)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profil(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Menyusun elemen secara vertikal
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pricelist Buket Bunga',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              'Tentukan pilihan bungamu disini!',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Informasi booking : 089669067568',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
                height: 16), // Memberikan jarak sebelum menampilkan produk
            Expanded(
              // GridView untuk menampilkan koleksi buket bunga dalam grid
              child: GridView.count(
                crossAxisCount: 2, // Menampilkan dua kolom dalam grid
                mainAxisSpacing: 16, // Jarak vertikal antar item grid
                crossAxisSpacing: 16, // Jarak horizontal antar item grid
                childAspectRatio:
                    0.7, // Menyesuaikan rasio aspek dari setiap item
                children: const [
                  FlowerCard(
                    imageUrl: 'img/flower1.jpg',
                    title: 'Buket Mawar Fresh',
                    price: 'Rp 150.000',
                  ),
                  FlowerCard(
                    imageUrl: 'img/flower2.jpg',
                    title: 'Buket Pink Fresh',
                    price: 'Rp 130.000',
                  ),
                  FlowerCard(
                    imageUrl: 'img/flower3.jpg',
                    title: 'Buket Plastik Mawar',
                    price: 'Rp 75.000',
                  ),
                  FlowerCard(
                    imageUrl: "img/flower4.jpg",
                    title: 'Buket Tulip Flower',
                    price: 'Rp 185.000',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk menampilkan setiap kartu bunga
class FlowerCard extends StatelessWidget {
  final String imageUrl; // URL gambar bunga
  final String title; // Judul buket bunga
  final String price; // Harga buket bunga

  const FlowerCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Bayangan untuk kartu
            blurRadius: 5, // Efek blur bayangan
            offset: const Offset(0, 3), // Posisi bayangan
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            // Menggunakan ClipRRect untuk membulatkan sudut gambar
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.asset(
                imageUrl, // Mengambil gambar agar sesuai URL yang diberikan
                fit: BoxFit
                    .cover, // Mengatur gambar agar memenuhi ruang yang tersedia
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: const TextStyle(fontSize: 10, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
