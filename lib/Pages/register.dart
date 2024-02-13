import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/Pages/Home.dart';
import 'package:flash/Pages/Login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _usernameController.text,
              password: _passwordController.text);
      print('User: ${userCredential.user!.email} created');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      print('Error during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Center(
                  child: Text(
                'FLASH TRACK',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 45,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.white, // Set the desired text color
                ),
                decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.mail),
                    prefixIconColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15,
                    ),
                    fillColor: Colors.grey.shade800,
                    labelText: "Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade800),
                      borderRadius: BorderRadius.circular(
                          20.0), // Set the same border radius here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _usernameController,
                style: const TextStyle(
                  color: Colors.white, // Set the desired text color
                ),
                decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.mail),
                    prefixIconColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15,
                    ),
                    fillColor: Colors.grey.shade800,
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade800),
                      borderRadius: BorderRadius.circular(
                          20.0), // Set the same border radius here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold)),
                validator: (val) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                      ? null
                      : "Please enter a valid email";
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white, // Set the desired text color
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    prefixIconColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15,
                    ),
                    fillColor: Colors.grey.shade800,
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade800),
                      borderRadius: BorderRadius.circular(
                          20.0), // Set the same border radius here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold)),
                validator: (val) {
                  if (val!.length < 6) {
                    return "Password must be at least 6 characters";
                  } else {
                    return null;
                  }
                },
                // onChanged: (val) {
                //   setState(() {
                //     password = val;
                //   });
                // },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: GestureDetector(
                  onTap: _login,
                  child: Container(
                    width: 200, // Set the desired width of the button
                    height: 50, // Set the desired height of the button
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.green,
                          Colors.green
                        ], // Replace with your desired gradient colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(
                          25), // Set the desired border radius
                    ),
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.white, // Set the text color
                          fontSize: 16, // Set the font size
                          fontWeight: FontWeight.bold, // Set the font weight
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Or',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Are you a user? ',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 140,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
