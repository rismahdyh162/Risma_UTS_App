import 'package:app_uts/profil.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8E1E1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8E1E1),
        elevation: 0,
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
                  ));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pricelist Buket Bunga',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFDE302F),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tentukan pilihan bungamu disini',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Informasi Booking : 0895366876608',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
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

class FlowerCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

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
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
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
