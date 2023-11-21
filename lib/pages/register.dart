import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_saga/components/component_input.dart';
import 'package:skin_saga/controllers/ApiClient.dart';
import 'package:skin_saga/pages/home.dart';
import 'package:skin_saga/pages/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void setTokenLogin(String token, String jsonLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', token);
    prefs.setString('jsonLogin', jsonLogin);
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
                height: 450,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 245, 250, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  padding: EdgeInsets.all(25),
                  children: [
                    ComponentInput(
                        labelText: 'Email', controller: emailController),
                    ComponentInput(
                        labelText: 'Nome', controller: nameController),
                    ComponentInput(
                        labelText: 'Senha', controller: passwordController),
                    ComponentInput(
                        labelText: 'Confirmar Senha',
                        controller: passwordController),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        var apiClient = ApiClient();
                        apiClient.fetch('register', {
                          'email': emailController.text,
                          'password': passwordController.text,
                          'name': nameController.text
                        }).then((value) {
                          if (value.statusCode == 200) {
                            Map<String, dynamic> jsonArray =
                                json.decode(value.body);
                            setTokenLogin(jsonArray['token'], value.body);
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
                      child: const Text('Criar Conta',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Ja possui conta?',
                            style: TextStyle(
                              color: Color.fromRGBO(124, 124, 124, 1),
                              fontWeight: FontWeight.w200,
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: const Text('Entre aqui'),
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
