import 'package:flutter/material.dart';

class OrderSummaryPage extends StatefulWidget {
  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HEKUO'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('HEKUO', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text('Pesanan Saya'),
              onTap: () {},
            ),
            // Add more drawer items here
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedTab = 0;
                  });
                },
                child: Text(
                  'Pembelian',
                  style: TextStyle(
                    color: _selectedTab == 0 ? Colors.white : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    _selectedTab == 0 ? Colors.green : Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedTab = 1;
                  });
                },
                child: Text(
                  'Penitipan',
                  style: TextStyle(
                    color: _selectedTab == 1 ? Colors.white : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    _selectedTab == 1 ? Colors.green : Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: _selectedTab == 0 ? buildOrderSummary(context) : buildPenitipan(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Penitipan'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
        selectedItemColor: Colors.green,
        currentIndex: 0, // Set the current index to Home
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }

  Widget buildOrderSummary(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Identitas Pembeli', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rijal Muhammad'),
                    Text('0821239988'),
                    Text('Jl. Siliwangi no 34 rt. 07 rw. 06'),
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                          label: Text('Edit Alamat'),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.note_add),
                          label: Text('Tambahkan Catatan'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: Image.network('https://example.com/kambing.jpg', width: 50, height: 50, fit: BoxFit.cover), // Replace with your image URL
                title: Text('Kambing'),
                subtitle: Text('Putih coklat'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                    Text('1'),
                    IconButton(icon: Icon(Icons.add), onPressed: () {}),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.local_shipping),
                  SizedBox(width: 8),
                  Text('Pilih metode pengiriman'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Ringkasan Pembayaran'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Harga: Rp. 3.000.000'),
                  Text('Biaya Pengiriman: Rp. 50.000'),
                  Text('Total Pembayaran: Rp. 3.050.000'),
                ],
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Cash'),
              subtitle: Text('Rp. 3.050.000'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Order'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPenitipan() {
    return Center(child: Text('Penitipan')); // Placeholder for Penitipan
  }
}
