import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vacua_app/constants/colors.dart';
import '../services/AuthService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthServices _auth = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool loading = false;
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          image: DecorationImage(
              image: AssetImage("assets/images/frame.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "VACUA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            const Text(
              "Use the password associated with your account",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
            if (errorText != "")
              Text(errorText,
                  style: const TextStyle(color: Colors.red, fontSize: 20.0)),
            const SizedBox(height: 10.0),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0),
                ),
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Email",
              ),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0),
                ),
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Password",
              ),
              controller: _passwordController,
            ),
            const SizedBox(height: 60.0),
            !loading
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: kPrimaryColor,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        errorText = "";
                        loading = true;
                      });
                      String res = await _auth.login(
                          _emailController.text, _passwordController.text);
                      setState(() {
                        errorText = res;
                        loading = false;
                      });
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      )),
    );
  }
}
