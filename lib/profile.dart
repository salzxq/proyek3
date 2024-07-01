import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        centerTitle: true,
        backgroundColor: Color.fromARGB(211, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            // Aksi ketika tombol kembali ditekan
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
