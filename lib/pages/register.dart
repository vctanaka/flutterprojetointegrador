import 'package:flutter/material.dart';
import 'package:skin_saga/components/component_input.dart';
import 'package:skin_saga/pages/login.dart';

class Register extends StatelessWidget {
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
                    // ComponentInput(labelText: 'Email'),

                    // ComponentInput(labelText: 'Nome'),

                    // ComponentInput(labelText: 'Senha'),

                    // ComponentInput(labelText: 'Confirmar Senha'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
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
