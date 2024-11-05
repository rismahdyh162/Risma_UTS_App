import 'package:app_uts/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Menghilangkan banner debug di aplikasi
      home:
          LoginPage(), // Halaman utama yang ditampilkan saat aplikasi pertama kali dijalankan
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey =
      GlobalKey<FormState>(); // Kunci untuk Form agar bisa melakukan validasi
  final TextEditingController _usernameController =
      TextEditingController(); // Controller untuk input username
  final TextEditingController _passwordController =
      TextEditingController(); // Controller untuk input password
  bool _obscurePassword = true; // Status untuk mengatur visibilitas password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
              16.0), // Memberikan jarak padding di sekitar elemen form
          child: Form(
            key: _formKey, // Mengaitkan Form dengan GlobalKey untuk validasi
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Menyusun elemen-elemen di tengah secara vertikal
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Menyusun elemen-elemen di tengah secara horizontal
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.local_florist,
                    color: Color(0xFFDE302F),
                    size: 40,
                  ),
                ),
                const SizedBox(
                    height:
                        24), // Memberikan jarak vertikal antara ikon dan teks
                const Text(
                  "Welcome To Flowerest",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDE302F),
                  ),
                  textAlign:
                      TextAlign.center, // Mengatur teks agar terpusat di tengah
                ),
                const SizedBox(
                    height:
                        3), // Mengatur jarak kecil antara teks judul dan deskripsi
                const Text(
                  "Fresh flower bouquets and plastic flowers are available!", // Deskripsi aplikasi
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  textAlign:
                      TextAlign.center, // Mengatur teks agar terpusat di tengah
                ),
                const SizedBox(
                    height:
                        32), // Memberikan jarak vertikal sebelum elemen input
                // Kolom untuk input username
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        12), // Membuat sudut input membulat
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.3), // Warna bayangan input
                        spreadRadius: 1, // ukuran bayangan
                        blurRadius: 5, // Menambahkan efek blur bayangan
                        offset: const Offset(0, 2), // Posisi bayangan
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller:
                        _usernameController, // Menghubungkan controller dengan field username
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      filled:
                          true, // Mengatur latar belakang input agar berwarna
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(12)), // Membulatkan sudut input
                        borderSide:
                            BorderSide.none, // Menghilangkan border input
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12), // Mengatur padding dalam input
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Isi username terlebih dahulu'; // Pesan kesalahan jika username kosong
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                    height:
                        16), // Memberi jarak vertikal antara input username dan password
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1, // ukuran bayangan
                        blurRadius: 5, // Menambahkan efek blur  bayangan
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller:
                        _passwordController, // Menghubungkan controller dengan field password
                    obscureText:
                        _obscurePassword, // Mengatur visibilitas password
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons
                                  .visibility_off // Ikon password tersembunyi
                              : Icons.visibility, // Ikon password terlihat
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword =
                                !_obscurePassword; // Mengubah visibilitas password
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Isi password terlebih dahulu'; // Pesan kesalahan jika password kosong
                      }
                      if (value.length < 6) {
                        return 'Password harus memiliki minimal 6 karakter'; // Pesan kesalahan jika password kurang dari 6 karakter
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                    height: 24), // Memberi jarak sebelum tombol login
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDE302F),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Jika validasi berhasil, melakukan navigasi ke page Menu
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Menu(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
