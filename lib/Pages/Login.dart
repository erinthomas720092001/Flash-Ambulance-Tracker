import 'package:flash/Pages/Home.dart';
import 'package:flash/Pages/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );
      print('User: ${userCredential.user!.email} logged in');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
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
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Center(
                  child: Text(
                'FLASH TRACK',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 45,
              ),
              TextFormField(
                controller: _usernameController,
                style: const TextStyle(
                  color: Colors.white, // Set the desired text color
                ),
                decoration: InputDecoration(
                    filled: true,
                    prefixIcon: const Icon(Icons.mail),
                    prefixIconColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
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
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                    labelStyle: const TextStyle(
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
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white, // Set the desired text color
                ),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.key),
                    prefixIconColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
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
                      borderSide: const BorderSide(color: Colors.amber),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                    labelStyle: const TextStyle(
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
              const SizedBox(
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
                      gradient: const LinearGradient(
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
                    child: const Center(
                      child: Text(
                        'Login',
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Or',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a user? ',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Register()));
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 140,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
