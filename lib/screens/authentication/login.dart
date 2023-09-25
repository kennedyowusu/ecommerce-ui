import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/screens/authentication/register.dart';
import 'package:ecommerce_project/screens/layout.dart';
import 'package:ecommerce_project/widgets/custom_input_field.dart';
import 'package:ecommerce_project/widgets/custom_loader.dart';
import 'package:ecommerce_project/widgets/custom_logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> _login() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    String email = emailController.text;
    String password = passwordController.text;

    if (formKey.currentState!.validate()) {
      await Future.delayed(Duration(seconds: 2));

      if (email == 'kobicypher@test.com' && password == '123456') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LayoutScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email or password is incorrect'),
          ),
        );
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kTertiaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: height * 0.1),
                  const CustomLogo(),
                  SizedBox(height: height * 0.1),
                  inputField(
                    controller: emailController,
                    hintText: 'Email Address',
                    prefixIcon: const Icon(Icons.email, color: Colors.grey),
                    keyboardType: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  inputField(
                    controller: passwordController,
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                    onbscureText: true,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50.0),
                    ),
                    onPressed: isLoading ? null : _login,
                    child: isLoading
                        ? const CustomLoader() // Show loading indicator
                        : const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Register',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
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
