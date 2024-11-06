import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kullanıcı Bilgileri',
      home: KullaniciBilgileri(),
    );
  }
}

class KullaniciBilgileri extends StatefulWidget {
  @override
  _KullaniciBilgileriState createState() => _KullaniciBilgileriState();
}

class _KullaniciBilgileriState extends State<KullaniciBilgileri> {
  final _formKey = GlobalKey<FormState>();

  String _isim = '';
  String _email = '';
  String _sifre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcı Bilgileri'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'İsim',
                    labelStyle: TextStyle(fontSize: 25),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen isminizi girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _isim = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'E-posta',
                    labelStyle: TextStyle(fontSize: 25), // Etiket font boyutu
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen e-posta adresinizi girin';
                  }
                  // E-posta format doğrulaması
                  final emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  if (!RegExp(emailPattern).hasMatch(value)) {
                    return 'Geçerli bir e-posta adresi girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(fontSize: 25),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen şifrenizi girin';
                  }
                  if (value.length < 6) {
                    return 'Şifre en az 6 karakter olmalı';
                  }
                  return null;
                },
                onSaved: (value) {
                  _sifre = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form başarıyla gönderildi!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 70), // Buton boyutu
                  backgroundColor: Colors.red, // Buton rengi
                  foregroundColor: Colors.white, // Buton yazı rengi
                ),
                child: Text(
                    'Gönder',
                     style: TextStyle(fontSize:20),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}