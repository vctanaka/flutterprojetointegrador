import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_saga/components/component_menu.dart';
import 'package:skin_saga/controllers/ApiClient.dart';
import 'package:skin_saga/controllers/Tools.dart';
import 'package:skin_saga/pages/coupon.dart';
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
  String loginName = '';

  Widget _displayTest() {
    return Center(
      child: Container(
        width: 320,
        height: 550,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 245, 250, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
              child: Text(
                'Nao sabe qual seu tipo de pele?',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(239, 108, 163, 1),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text('Faça o teste e descubra para começar!',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(95, 95, 95, 1),
                )),
            SizedBox(height: 15),
            SizedBox(
              width: 300.0,
              height: 300.0,
              child: Image.asset('lib/img/body.png', fit: BoxFit.fitWidth),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizStart()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(219, 88, 143, 1),
                minimumSize: Size(150, 60),
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
      child: Container(
        width: 320,
        height: 660,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 245, 250, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
              child: Text(
                'Seu Tipo de Pele é:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(146, 96, 120, 1),
                ),
              ),
            ),
            SizedBox(height: 25),
            Tools().waitBuilder(
              getSkinType(),
              (value) => ElevatedButton(
                onPressed: () {},
                child: Text(
                  value.toString(),
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
            ),

            SizedBox(height: 15),

            Center(
              child: SizedBox(
                width: 300.0,
                height: 300.0,
                child: Image.asset('lib/img/body.png', fit: BoxFit.fitWidth),
              ),
            ),
            // Container(
            //     margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
            //     child: ClipRRect(
            //         borderRadius: BorderRadius.all(Radius.circular(10)),
            //         child: LinearProgressIndicator(
            //           minHeight: 7,
            //           value: 0.1, //TODO: pegar valor de progresso
            //           backgroundColor: Color.fromRGBO(224, 130, 130, 0.3),
            //           valueColor: AlwaysStoppedAnimation<Color>(
            //               Color.fromRGBO(174, 70, 120, 1)),
            //         ))),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                'Pontos Acumulados',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(174, 70, 120, 1),
                ),
              ),
            ),
            SizedBox(height: 25),
            Tools().waitBuilder(
              getPoints(),
              (value) => ElevatedButton(
                onPressed: () {},
                child: Text(
                  value.toString() + ' Pontos',
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
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Coupon()),
                );
              },
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
            // Container(
            //   child: Expanded(
            //     child: Text(
            //       '1/20 Desafios Cumpridos',
            //       style: TextStyle(
            //         fontSize: 13,
            //         fontFamily: 'Rambla',
            //         color: Color.fromRGBO(174, 70, 120, 1),
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   child: Expanded(
            //     child: IconButton(
            //       onPressed: () {},
            //       icon: Icon(Icons.military_tech),
            //       iconSize: 30,
            //       color: Color.fromRGBO(174, 70, 120, 1),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<Widget> testDone() async {
    return Tools().getLoginId().then((idLogin) {
      var apiClient = ApiClient();
      return apiClient.fetchAuth('getSkinType', {
        'id': idLogin.toString(),
      }).then((value) {
        var respDecode = json.decode(value.body);
        var skintype = respDecode['skin_type'];
        if (value.statusCode == 200) {
          if (skintype != null) {
            return _existTest();
          }
          return _displayTest();
        }
        return Container();
      });
    });
  }

  Future<String> getSkinType() async {
    ApiClient apiClient = ApiClient();
    var id = await Tools().getLoginId();
    var response = await apiClient.fetchAuth('getSkinType', {
      'id': id.toString(),
    });
    var respDecode = json.decode(response.body);
    return respDecode['skin_type'];
  }

  Future<String> getLoginName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonLogin = prefs.getString('jsonLogin');
    Map<String, dynamic> jsonLoginDecode = json.decode(jsonLogin ?? '');

    loginName = jsonLoginDecode['login']['name'];
    return jsonLoginDecode['login']['name'];
  }

  Future<int> getPoints() async {
    ApiClient apiClient = ApiClient();
    var id = await Tools().getLoginId();
    var response = await apiClient.fetchAuth('getPoints', {
      'id': id.toString(),
    });
    var respDecode = json.decode(response.body);
    return respDecode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ComponentMenu(
        currentIndex: _currentIndex,
        onTap: (index) => Tools().bottomMenu(index, context),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              // ,SizedBox(height: 10)

              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Tools().waitBuilder(
                      getLoginName(),
                      (value) => Text(
                        'Olá, ' + value,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
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
              FutureBuilder(
                future: testDone(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!;
                  } else {
                    return Stack(
                      children: [
                        Container(
                          color: Colors.white,
                        ),
                        Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(
                              color: Color.fromRGBO(249, 214, 230, 1),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
