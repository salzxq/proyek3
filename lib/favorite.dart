import 'package:flutter/material.dart';
import 'detail_produk.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool showSapiGrid = false;

  void toggleGridView() {
    setState(() {
      showSapiGrid = !showSapiGrid;
    });
  }

  void navigateToDetail(BuildContext context, String title, String imageUrl) {
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detail_produk(title: title, imageUrl: imageUrl),
      ),
    );// Implementasi navigasi ke halaman detail
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        centerTitle: true,
        backgroundColor: Color.fromARGB(210, 241, 241, 241),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 253, 253, 253),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showSapiGrid = false;
                                });
                              },
                              child: Text('Kambing',
                                  style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
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
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showSapiGrid = true;
                                });
                              },
                              child: Text('Sapi',
                                  style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
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
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: showSapiGrid
                            ? SapiGrid(navigateToDetail: navigateToDetail)
                            : KambingGrid(navigateToDetail: navigateToDetail),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SapiGrid extends StatelessWidget {
  final Function navigateToDetail;

  SapiGrid({required this.navigateToDetail});
  final List<String> sapiImages = [
    'assets/image/sapi1.png',
    'assets/image/sapi2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: sapiImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            navigateToDetail(context, 'Sapi $index', sapiImages[index]);
          },
          child: Image.asset(sapiImages[index]),
        );
      },
    );
  }
}

class KambingGrid extends StatelessWidget {
  final Function navigateToDetail;

  KambingGrid({required this.navigateToDetail});
final List<String> kambingImages = [
    'assets/image/hewan kurban2.png',
    'assets/image/hewan kurban3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: kambingImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            navigateToDetail(context, 'Kambing $index', kambingImages[index]);
          },
          child: Image.asset(kambingImages[index]),
        );
      },
    );
  }

void main() {
  runApp(MaterialApp(
    home: Favorite(),
  ));
}
}
