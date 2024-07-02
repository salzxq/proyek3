import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:proyek3/login_page.dart';
// import 'tabbar.dart';  // Impor tabbar.dart yang berisi NavigationMenu
// import 'detail_produk.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginScreen(),  // Gunakan NavigationMenu sebagai halaman utama
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool showSapiGrid = false;

//   void toggleGridView() {
//     setState(() {
//       showSapiGrid = !showSapiGrid;
//     });
//   }

//   void navigateToDetail(BuildContext context, String title, String imageUrl) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Detail_produk(title: title, imageUrl: imageUrl),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: 265.0,
//                 color: Color.fromARGB(212, 27, 174, 118),
//               ),
//               Expanded(
//                 child: Container(
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       SizedBox(height: 80),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(width: 20),
//                             ElevatedButton(
//                               onPressed: () {
//                                 setState(() {
//                                   showSapiGrid = false;
//                                 });
//                               },
//                               child: Text('Kambing',
//                                   style: TextStyle(color: Colors.white)),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.green,
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 15.0, vertical: 10.0),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 textStyle: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             ElevatedButton(
//                               onPressed: () {
//                                 setState(() {
//                                   showSapiGrid = true;
//                                 });
//                               },
//                               child: Text('Sapi',
//                                   style: TextStyle(color: Colors.white)),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.green,
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 15.0, vertical: 10.0),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 textStyle: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Expanded(
//                         child: showSapiGrid
//                             ? SapiGrid(navigateToDetail: navigateToDetail)
//                             : KambingGrid(navigateToDetail: navigateToDetail),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             top: 170.0,
//             left: 10.0,
//             right: 0,
//             child: Container(
//               height: 200.0,
//               child: Image.asset(
//                 'image/Banner.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: CustomAppBar(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200.0,
//       child: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         flexibleSpace: Stack(
//           children: [
//             Positioned(
//               left: 30.0,
//               top: 45.0,
//               child: Icon(Icons.home, color: Colors.white, size: 30.0),
//             ),
//             Positioned(
//               left: 72.0,
//               top: 45.0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("HEKUO",
//                       style: TextStyle(color: Colors.white, fontSize: 20)),
//                   Text("Dashboard",
//                       style: TextStyle(color: Colors.white, fontSize: 14)),
//                 ],
//               ),
//             ),
//             Positioned(
//               right: 30.0,
//               top: 45.0,
//               child: Icon(Icons.account_circle_outlined,
//                   color: Colors.white, size: 30.0),
//             ),
//             Positioned(
//               left: 40.0,
//               right: 40.0,
//               top: 120.0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 226, 226, 226),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: TextField(
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     hintText: 'Cari Hewan Kurban..',
//                     hintStyle: TextStyle(color: Colors.grey[600]),
//                     border: InputBorder.none,
//                     prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(200.0);
// }

// class KambingGrid extends StatelessWidget {
//   final Function(BuildContext, String, String) navigateToDetail;

//   KambingGrid({required this.navigateToDetail});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(10.0),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10.0,
//         mainAxisSpacing: 10.0,
//       ),
//       itemCount: 8,
//       itemBuilder: (BuildContext context, int index) {
//         return GestureDetector(
//           onTap: () {
//             navigateToDetail(
//                 context, 'Kambing Item $index', 'image/Hewan Qurban.png');
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.greenAccent,
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: Center(
//               child: Image.asset(
//                'image/hewan kurban2.png', // Path ke gambar yang ingin ditampilkan
//                 fit: BoxFit.cover, // Mengatur bagaimana gambar menyesuaikan di dalam widget
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class SapiGrid extends StatelessWidget {
//   final Function(BuildContext, String, String) navigateToDetail;

//   SapiGrid({required this.navigateToDetail});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(10.0),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10.0,
//         mainAxisSpacing: 10.0,
//       ),
//       itemCount: 8,
//       itemBuilder: (BuildContext context, int index) {
//         return GestureDetector(
//           onTap: () {
//             navigateToDetail(
//                 context, 'Sapi Item $index', 'image/sapi1.png');
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: Center(
//               child: Image.asset(
//                 'image/sapi1.png', // Path ke gambar yang ingin ditampilkan
//                 fit: BoxFit.cover, // Mengatur bagaimana gambar menyesuaikan di dalam widget
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
