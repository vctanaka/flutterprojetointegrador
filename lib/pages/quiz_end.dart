import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_saga/controllers/ApiClient.dart';
import 'package:skin_saga/controllers/Tools.dart';
import 'package:skin_saga/pages/home.dart';
import 'package:skin_saga/pages/quiz_start.dart';

class QuizEnd extends StatefulWidget {
  final String skinType;
  const QuizEnd({super.key, required this.skinType});

  @override
  State<QuizEnd> createState() => _QuizEndState();
}

class _QuizEndState extends State<QuizEnd> {
  void setSkinType(String skinT) async {
    try {
      print(skinT);
      Tools().getLoginId().then((value) {
        print(value);
        var apiClient = ApiClient();
        apiClient.fetchAuth(
            'upSkinType', {'skin_type': skinT, 'id': value.toString()});
      });

      await Tools().refreshLogin();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
        (route) => false,
      );
    } catch (e) {
      print(e);
    }
  }

  Widget _displaytype(context) {
    Widget displayReturn;
    var testValue = widget.skinType;

    switch (testValue) {
      case 'normal':
        displayReturn = Text(
          'Normal',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        );
        break;
      case 'oleosa':
        displayReturn = Text(
          'Oleosa',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        );
        break;
      case 'seca':
        displayReturn = Text(
          'Seca',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        );
        break;
      case 'mista':
        displayReturn = Text(
          'Mista',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        );
        break;
      default:
        displayReturn = Text(
          'Selecionar uma resposta',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
        );
    }
    return displayReturn;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(children: [
            Text(
              'Seu tipo de pele é :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(219, 88, 143, 1),
              ),
            ),
            SizedBox(height: 35),
            _displaytype(context),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 360.0,
                height: 360.0,
                child: Image.asset('lib/img/face.png', fit: BoxFit.fitWidth),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setSkinType(widget.skinType);
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Meu tipo de Pele parece correto',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                primary: Color.fromRGBO(255, 245, 250, 1),
                onPrimary: Colors.white,
                maximumSize: Size(330, 55),
                minimumSize: Size(330, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => QuizStart()),
                );
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Refazer Teste',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                primary: Color.fromRGBO(255, 245, 250, 1),
                onPrimary: Colors.white,
                maximumSize: Size(330, 55),
                minimumSize: Size(330, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
