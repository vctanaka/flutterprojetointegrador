import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_saga/pages/login.dart';
import 'package:skin_saga/pages/quiz_start.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text(
                'Perfil',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                icon: Icon(Icons.circle_rounded),
                iconSize: 150,
                color: Color.fromRGBO(249, 214, 230, 1),
              ),
              SizedBox(height: 16),
              Text(
                'Kristielle Dias',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Icon(
                            Icons.lock_clock_outlined,
                            color: Color.fromRGBO(219, 88, 143, 1),
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Privacidade e Segurança',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Icon(
                            Icons.notifications_active_outlined,
                            color: Color.fromRGBO(219, 88, 143, 1),
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Notificacoes',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Icon(
                            Icons.scanner_outlined,
                            color: Color.fromRGBO(219, 88, 143, 1),
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizStart(),
                              ),
                            );
                          },
                          child: const Text(
                            'Teste de Tipo de Pele',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Icon(
                            Icons.collections_bookmark_outlined,
                            color: Color.fromRGBO(219, 88, 143, 1),
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Historico de Pontos',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Icon(
                            Icons.airplane_ticket_outlined,
                            color: Color.fromRGBO(219, 88, 143, 1),
                            size: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Cupons de Desconto',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 65),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              removeToken();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 245, 250, 1),
                              minimumSize: Size(70, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text('Sair',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(219, 88, 143, 1),
                                )),
                          ),
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
