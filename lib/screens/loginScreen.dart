import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Login", style: TextStyle(fontSize: 30.0)),
              const SizedBox(height: 40.0),
              if(errorText != "")  Text(errorText, style: const TextStyle(color: Colors.red, fontSize: 20.0)),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                controller: _passwordController,
              ),
              const SizedBox(height: 40.0),
              !loading ? 
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    errorText = "";
                    loading = true;
                  });
                  String res = await _auth.login(_emailController.text, _passwordController.text);
                  setState(() {
                    errorText = res;
                    loading = false;
                  });
                },
                child: const Text("Login"),
              ) :
              const CircularProgressIndicator(),
            ],
          ),
        )
      ),
    );
  }
}