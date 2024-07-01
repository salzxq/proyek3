import 'package:flutter/material.dart';


class OrderHistory {
  final String orderCode;
  final String orderNumber;
  final String customerName;
  final String phoneNumber;
  final String storageDuration;
  final int quantity;
  final double totalPrice;

  OrderHistory({
    required this.orderCode,
    required this.orderNumber,
    required this.customerName,
    required this.phoneNumber,
    required this.storageDuration,
    required this.quantity,
    required this.totalPrice,
  });
}

class notifikasi_order extends StatelessWidget {
  final List<OrderHistory> orders = [
    OrderHistory(
      orderCode: 'S.N PK001',
      orderNumber: '001',
      customerName: 'John Doe',
      phoneNumber: '1234567890',
      storageDuration: '1 bulan',
      quantity: 2,
      totalPrice: 200.0,
    ),
    OrderHistory(
      orderCode: 'S.N PK002',
      orderNumber: '002',
      customerName: 'Jane Smith',
      phoneNumber: '9876543210',
      storageDuration: '2 minggu',
      quantity: 1,
      totalPrice: 100.0,
    ),
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histori Pesanan',
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
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return _buildOrderItem(context, orders[index]);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildOrderItem(BuildContext context, OrderHistory order) {
  return Card(
    margin: EdgeInsets.all(10.0),
    child: ListTile(
      title: Text('S.N: ${order.orderCode} - Order No: ${order.orderNumber}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nama Pemesan: ${order.customerName}'),
          Text('No. Handphone: ${order.phoneNumber}'),
          Text('Jangka Waktu Penitipan: ${order.storageDuration}'),
          Text('Quantity Pesanan: ${order.quantity.toString()}'),
          Text('Total Pembayaran: Rp ${order.totalPrice.toString()}'),
        ],
      ),
    ),
  );
}
