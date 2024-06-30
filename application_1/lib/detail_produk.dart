import 'package:flutter/material.dart';

class Detail_produk extends StatelessWidget {
  final String title;
  final String imageUrl;

  const Detail_produk({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(212, 27, 174, 118),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Aksi ketika tombol kembali ditekan
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.white,
            ),
            onPressed: () {
              // Aksi ketika tombol favorit ditekan
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar produk dari lokal dengan jarak ke AppBar yang disesuaikan
          Padding(
            padding: const EdgeInsets.only(
                top: 19.0), // Jarak antara gambar dan AppBar
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // Border radius
                child: Image.asset(
                  'image/hewan kurban3.png', // Jalur gambar lokal
                  height: 180, // Tinggi gambar, bisa disesuaikan
                  width: 300, // Lebar gambar menyesuaikan
                  fit: BoxFit.cover, // Mengatur gambar agar menyesuaikan ukuran container
                ),
              ),
            ),
          ),
          const SizedBox(height: 16), // Memberikan jarak antara gambar dan teks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'kambing',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold), // Penyesuaian teks
                        textAlign: TextAlign.left, // Posisikan teks di kiri
                      ),
                      const SizedBox(
                          height:
                              8), // Jarak antara teks "kambing" dan "jenis kambing"
                      Text(
                        'kambing jawa',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors
                                .grey), // Penyesuaian teks untuk jenis kambing
                        textAlign: TextAlign.left, // Posisikan teks di kiri
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0), // Menurunkan ikon
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // Aksi ketika ikon favorite ditekan
                        },
                      ),
                      const SizedBox(width: 16), // Jarak antara ikon favorite dan ikon list
                      IconButton(
                        icon: const Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Aksi ketika ikon list ditekan
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
           const SizedBox(height: 16), // Memberikan jarak antara gambar dan teks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deskripsi Produk',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold), // Penyesuaian teks
                        textAlign: TextAlign.left, // Posisikan teks di kiri
                      ),
                      const SizedBox(
                          height:
                              8), // Jarak antara teks "kambing" dan "jenis kambing"
                      Text(
                        'kambing jawa dengan bobot 7 kg yang berusia 2,5 tahun cocok untuk kurban dijamin kualitas unggulan ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors
                                .grey), // Penyesuaian teks untuk jenis kambing
                        textAlign: TextAlign.left, // Posisikan teks di kiri
                      ),
                      const SizedBox(
                          height:
                              8), 
                      Text('Berat',
                      style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                          height:
                              8),
                      Text(
                        '7 - 10 kg',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors
                                .grey), // Penyesuaian teks untuk jenis kambing
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                          height:
                              8), 
                      Text('Harga',
                      style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                          height:
                              8),
                      Text(
                        'Rp 3.000.000',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors
                                .greenAccent), // Penyesuaian teks untuk jenis kambing
                        textAlign: TextAlign.left,
                      ),
                       
                       SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                              },
                              child: Text('Beli Sekarang',
                                  style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 47, 135, 50),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ), // Posisikan teks di kiri // Posisikan teks di kiri
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );     
  }
}
