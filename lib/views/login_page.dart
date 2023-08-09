import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Get.put(LoginController());
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('header-login.png'),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Image.asset('logo.png'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    ),
                    const Text('Please sign in to continue'),
                    const SizedBox(height: 16.0,),
                    TextFormField(
                      controller: _controllerUsername,
                      decoration: InputDecoration(
                        labelText: 'User ID',
                        hintText: 'User ID',
                        hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.deepPurple)
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    TextFormField(
                      controller: _controllerPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),                      
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.deepPurple)
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                        ),
                        onPressed: (){
                          loginController.login(_controllerUsername.text, _controllerPassword.text);
                        }, 
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Text('Don\'t have account? Sign up')
              ),
            ),
          ],
        ),
      ),
    );
  }
}