import 'package:flutter/material.dart';
import 'registrasi_page.dart';
import 'package:toko_api/bloc/login_bloc.dart';
import 'package:toko_api/helpers/user_info.dart';
import 'package:toko_api/ui/produk_page.dart';
import 'package:toko_api/widget/warning_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) :super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(key: _formKey,
          child: Column(children: [
            _emailTextField(),
            _passwordTextField(),
            _buttonLogin(),
            const SizedBox(
              height: 30,
            ),
            _menuRegistrasi()
          ],
          ),
          ),
          ),
          ),
    );
  }

//Membuat Textbox email
Widget _emailTextField() {
  return TextFormField(
    decoration: const InputDecoration(labelText: "Email"),
    keyboardType: TextInputType.emailAddress,
    controller: _emailTextboxController,
    validator: (value){
      //validasi harus diisi
      if (value!.isEmpty) {
        return 'Email harus diisi';
      }
      return null;
    },
  );
}

//Membuat textbox password
Widget _passwordTextField() {
  return TextFormField(
    decoration: const InputDecoration(labelText: "Password"),
    keyboardType: TextInputType.text,
    obscureText: true,
    controller: _passwordTextboxController,
    validator: (value) {
      //jika karakter yang dimasukan kurang dari 6 karakter
      if (value!.isEmpty) {
        return "Password harus diisi";
      }
      return null;
    },
  );
}

//Membuat tombol login
Widget _buttonLogin() {
  return ElevatedButton(child: const Text("Login"),
  onPressed: () {
    var validate = _formKey.currentState!.validate();
  });
}

//Membuat menu untuk membuka halaman registrasi
Widget _menuRegistrasi() {
  return Center(
    child: InkWell(child: const Text("Registrasi",
    style: TextStyle(color: Colors.blue),
    ),
    onTap: () {
      Navigator.push(context,
       MaterialPageRoute(builder: (context) => const RegistrasiPage(
       )));
    },
    ),
    );
}
}