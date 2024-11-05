import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDE302F),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFFDE302F),
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("img/mypoto.png"),
                ),
                SizedBox(height: 10),
                Text(
                  'Risma Bidayatul Hidayah',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '21670015',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Kelas',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'MK',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20), // Memberikan jarak horizontal.
                    Column(
                      children: [
                        Text(
                          '5B',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          'Mobile Programming',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Expanded digunakan untuk memperluas ListView agar mengisi ruang kosong yang tersisa.
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: const [
                ProfileItem(
                  icon: Icons.email,
                  title: 'Email',
                  subtitle: 'rismahdyh162@gmail.com',
                ),
                ProfileItem(
                  icon: Icons.home,
                  title: 'Alamat',
                  subtitle: 'Kendal',
                ),
                ProfileItem(
                  icon: Icons.brush,
                  title: 'Hobi',
                  subtitle: 'Watching Kdrama',
                ),
                ProfileItem(
                  icon: Icons.format_quote,
                  title: 'Motto',
                  subtitle: 'Simple Life in My World',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon; // Ikon untuk item profil.
  final String title; // Judul item profil.
  final String subtitle; // Subtitle item profil.

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), // Memberikan padding vertikal untuk jarak.
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFDE302F)),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(subtitle),
            ],
          ),
        ],
      ),
    );
  }
}
