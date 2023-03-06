import 'dart:ui';

import 'package:flutter/material.dart';
import '../components/buttonWidget.dart';
import '../components/inputWidget.dart';
import '../services/AuthService.dart';
import 'classRoomScreen.dart';

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

  Future<void> _navigateToNextPage(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ClassRooms(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                opacity: 1.0,
                colorFilter: ColorFilter.linearToSrgbGamma()
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width > 600 ? 200.0 : 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.0,
                    child: Center(
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Padding(
                    padding: MediaQuery.of(context).size.width > 600
                        ? const EdgeInsets.only(left: 30.0)
                        : const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      "Welcome",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                  ),
                  if (errorText != "")
                    Text(
                      errorText,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                      ),
                    ),
                  CustomInputField(
                    hintText: "Email",
                    controller: _emailController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20.0),
                  CustomInputField(
                    hintText: "Password",
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 60.0),
                  !loading
                      ? Center(
                          child: CustomButton(
                            label: "Login",
                            width: 300.0,
                            height: 50.0,
                            onPressed: () async {
                              setState(() {
                                errorText = "";
                                loading = true;
                              });
                              String res = await _auth.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                              setState(() {
                                errorText = res;
                                loading = false;
                              });
                              await _navigateToNextPage(context);
                            },
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
