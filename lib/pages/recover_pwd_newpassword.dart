import 'package:flutter/material.dart';
import 'package:skin_saga/components/component_input.dart';
import 'package:skin_saga/pages/login.dart';

class RecoverPwd extends StatefulWidget {
  const RecoverPwd({super.key});

  @override
  State<RecoverPwd> createState() => _RecoverPwdState();
}

class _RecoverPwdState extends State<RecoverPwd> {
  TextEditingController emailController = TextEditingController();
  TextEditingController codigoController = TextEditingController();

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
                    SizedBox(height: 20),
                    ComponentInput(
                        labelText: 'Email', controller: emailController),
                    SizedBox(height: 10),
                    ComponentInput(
                        labelText: 'Codigo de Verificação',
                        controller: codigoController),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Enviar email de verificação',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w200)),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(219, 88, 143, 1),
                        minimumSize: Size(70, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Recuperar Senha',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )),
                    ),
                    SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: const Text('Cancelar',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
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
