import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vacua_app/models/users.dart';
import '../components/buttonWidget.dart';
import '../components/inputWidget.dart';
import '../services/AuthService.dart';
import 'classRoomScreen.dart';
// App localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  Future<void> _loginUser(BuildContext context) async {
    setState(() {
      errorText = "";
      loading = true;
    });
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        errorText = "All fields must be filled";
        loading = false;
      });
      return;
    }

    // Validate email address
    if (!User.validateEmail(_emailController.text)) {
      setState(() {
        errorText = "Invalid email provided";
        loading = false;
      });
      return;
    }

    try {
      await _auth.login(_emailController.text, _passwordController.text);
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ClassRooms(),
        ),
      );
    } catch (e) {
      setState(() {
        errorText = e.toString();
        loading = false;
      });
      return;
    }
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
                  colorFilter: ColorFilter.linearToSrgbGamma()),
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
                    child: Text(
                      AppLocalizations.of(context)!.welcome,
                      style:
                          const TextStyle(fontSize: 30.0, color: Colors.white),
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
                    hintText: AppLocalizations.of(context)!.email,
                    controller: _emailController,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20.0),
                  CustomInputField(
                    hintText: AppLocalizations.of(context)!.password,
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 60.0),
                  !loading
                      ? Center(
                          child: CustomButton(
                            label: AppLocalizations.of(context)!.login,
                            width: 300.0,
                            height: 50.0,
                            onPressed: () async {
                              await _loginUser(context);
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
