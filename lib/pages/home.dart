import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_saga/components/component_menu.dart';
import 'package:skin_saga/pages/history.dart';
import 'package:skin_saga/pages/mission.dart';
import 'package:skin_saga/pages/points.dart';
import 'package:skin_saga/pages/profile.dart';
import 'package:skin_saga/pages/quiz_start.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void _onItemTapped(int index, BuildContext context) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mission()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Points()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => History()),
      );
    }
  }

  Widget _displayTest() {
    return Center(
      child: Container(
        width: 300,
        height: 500,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 245, 250, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: Text(
                'Nao sabe qual seu tipo de pele?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(239, 108, 163, 1),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Faca o teste e descubra para começar!',
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(95, 95, 95, 1),
                )),
            SizedBox(height: 50),
            Image.asset('lib/img/body.png'),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizStart()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(219, 88, 143, 1),
                minimumSize: Size(70, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Começar Teste',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _existTest() {
    return Center(
      child: Expanded(
        child: Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 245, 250, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                  child: Text(
                    'Pontos Acumulados',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(174, 70, 120, 1),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    '200 Pontos',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ), //TODO: pegar valor de pontos

                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(219, 88, 143, 1),
                    minimumSize: Size(160, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text('Troque seus pontos por cupons de desconto',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(95, 95, 95, 1),
                        ),
                        textAlign: TextAlign.center),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 230.0,
                    height: 230.0,
                    child:
                        Image.asset('lib/img/body.png', fit: BoxFit.fitWidth),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          minHeight: 7,
                          value: 0.1, //TODO: pegar valor de progresso
                          backgroundColor: Color.fromRGBO(224, 130, 130, 0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromRGBO(174, 70, 120, 1)),
                        ))),
                SizedBox(height: 5),
                Text('1/20 Desafios Cumpridos',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Rambla',
                      color: Color.fromRGBO(174, 70, 120, 1),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.military_tech),
                    iconSize: 30,
                    color: Color.fromRGBO(174, 70, 120, 1))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Widget> testDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? testDone = prefs.getBool('testDone');
    if (testDone != null) {
      return _existTest();
    } else {
      return _displayTest();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ComponentMenu(
        currentIndex: _currentIndex,
        onTap: (index) {
          _onItemTapped(index, context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
            child: Text('Escolha seu perfil'),
          )
          // ,SizedBox(height: 10)
          ,
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Olá, Kris' //TODO: pegar nome do usuário
                    ,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Spacer(),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    icon: Icon(Icons.circle_rounded),
                    iconSize: 50,
                    color: Color.fromRGBO(249, 214, 230, 1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ElevatedButton(
                  child: Text('Pele Comum',
                      style:
                          TextStyle(color: Color.fromRGBO(239, 108, 163, 1))),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 0.8,
                      color: Color.fromRGBO(239, 108, 163, 1),
                    ),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ElevatedButton(
                    child: Text('Combinacao',
                        style:
                            TextStyle(color: Color.fromRGBO(239, 108, 163, 1))),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 0.8,
                        color: Color.fromRGBO(239, 108, 163, 1),
                      ),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ElevatedButton(
                    child: Text('Pele Oleosa',
                        style:
                            TextStyle(color: Color.fromRGBO(239, 108, 163, 1))),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 0.8,
                        color: Color.fromRGBO(239, 108, 163, 1),
                      ),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ElevatedButton(
                    child: Text('Pele Madura',
                        style:
                            TextStyle(color: Color.fromRGBO(239, 108, 163, 1))),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 0.8,
                        color: Color.fromRGBO(239, 108, 163, 1),
                      ),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ElevatedButton(
                    child: Text('Pele Seca',
                        style:
                            TextStyle(color: Color.fromRGBO(239, 108, 163, 1))),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 0.8,
                        color: Color.fromRGBO(239, 108, 163, 1),
                      ),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 35),
          _displayTest()
        ],
      ),
    );
  }
}
