import 'package:flutter/material.dart';
import 'package:toko_api/helpers/user_info.dart';
import 'package:toko_api/ui/login_page.dart';
import 'package:toko_api/ui/produk_page.dart';
import 'package:toko_api/ui/registrasi_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key ? key}): super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State < MyApp > {
  Widget Page =
  const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        Page = const ProdukPage();
      });
    } else {
      setState(() {
        Page = const LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      home: Page,
    );
  }
}