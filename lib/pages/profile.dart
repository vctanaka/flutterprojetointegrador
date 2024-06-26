import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_saga/controllers/Tools.dart';
import 'package:skin_saga/pages/coupon.dart';
import 'package:skin_saga/pages/login.dart';
import 'package:skin_saga/pages/pointshistory.dart';
import 'package:skin_saga/pages/quiz_start.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String loginName = '';

  void removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  Future<String> getLoginName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonLogin = prefs.getString('jsonLogin');
    Map<String, dynamic> jsonLoginDecode = json.decode(jsonLogin ?? '');

    loginName = jsonLoginDecode['login']['name'];
    return jsonLoginDecode['login']['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: Text(
                    'Perfil',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30),
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
                SizedBox(height: 25),
                Center(
                  child: Tools().waitBuilder(
                    getLoginName(),
                    (value) => Text(
                      value,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.collections_bookmark_outlined,
                              color: Color.fromRGBO(219, 88, 143, 1),
                              size: 30,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PointsHistory(),
                                ),
                              );
                            },
                            child: const Text(
                              'Historico de Pontos',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.discount_outlined,
                              color: Color.fromRGBO(219, 88, 143, 1),
                              size: 30,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Coupon(),
                                ),
                              );
                            },
                            child: const Text(
                              'Cupons de Desconto',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Icon(
                                      Icons.logout,
                                      color: Color.fromRGBO(219, 88, 143, 1),
                                    ),
                                  ),
                                  Text(
                                    'Sair',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(219, 88, 143, 1),
                                    ),
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}
