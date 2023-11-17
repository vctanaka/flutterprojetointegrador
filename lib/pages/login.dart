import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_saga/components/component_input.dart';
import 'package:skin_saga/controllers/ApiClient.dart';
import 'package:skin_saga/pages/home.dart';
import 'package:skin_saga/pages/recover_pwd_email.dart';
import 'package:skin_saga/pages/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', token);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('lib/img/splash.png', height: 300, width: 450),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 430,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 245, 250, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  padding: EdgeInsets.all(25),
                  children: [
                    SizedBox(height: 40),
                    ComponentInput(
                        labelText: 'Usuario', controller: emailController),
                    SizedBox(height: 10),
                    ComponentInput(
                        labelText: 'Senha', controller: passwordController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecoverPwdEmail()));
                          },
                          child: const Text('Esqueceu a senha ?',
                              style: TextStyle(
                                fontSize: 13,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        var apiClient = ApiClient();
                        apiClient.fetch('authLogin', {
                          'email': emailController.text,
                          'password': passwordController.text
                        }).then((value) {
                          if (value.statusCode == 200) {
                            Map<String, dynamic> jsonArray =
                                json.decode(value.body);
                            print('deu certo');
                            setToken(jsonArray['token']);
                          } else {
                            print('erro');
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(219, 88, 143, 1),
                        minimumSize: Size(70, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Não tem conta ainda?',
                            style: TextStyle(
                              color: Color.fromRGBO(124, 124, 124, 1),
                              fontWeight: FontWeight.w200,
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: const Text('Registre-se'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
