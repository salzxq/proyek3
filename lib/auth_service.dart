import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://localhost/api/auth.php';

  static Future<bool> login(String email, String password) async {
  try {
    var response = await http.post(Uri.parse(baseUrl), body: {
      'action': 'login',
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        return true; // Login berhasil
      } else {
        return false; // Login gagal
      }
    } else {
      print('Failed to load data, status code: ${response.statusCode}');
      return false; // Terjadi kesalahan HTTP
    }
  } catch (e) {
    print('Error during login: $e');
    return false; // Terjadi kesalahan umum
  }
}


  static Future<bool> register(String email, String password) async {
    try {
      // Mengirim HTTP POST request untuk register
      var response = await http.post(Uri.parse(baseUrl), body: {
        'action': 'register',
        'email': email,
        'password': password,
      });

      // Menguraikan respons JSON dari backend
      var responseData = json.decode(response.body);

      // Mengembalikan true jika registrasi berhasil, false jika tidak
      return true;
    } catch (e) {
      print('Error during registration: $e');
      return false; // Jika terjadi kesalahan, anggap registrasi gagal
    }
  }
}
