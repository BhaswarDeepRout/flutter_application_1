import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(fontFamily: 'Oswald'),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Login Info Icon Pressed")),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "KRS Classes",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Image.asset("assets/Screenshot (609).png", height: 200),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter username";
                    }
                    final regex = RegExp(r'^[a-zA-Z0-9]+$');
                    if (!regex.hasMatch(value)) {
                      return "Only letters and numbers allowed";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(14),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Username: ${_usernameController.text}");
                      print("Password: ${_passwordController.text}");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Successful")),
                      );
                    }
                  },
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
