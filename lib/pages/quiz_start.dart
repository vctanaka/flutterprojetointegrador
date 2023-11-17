import 'package:flutter/material.dart';
import 'package:skin_saga/pages/quiz_end.dart';

class QuizStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text(
                'Descubra seu Tipo de Pele',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(219, 88, 143, 1),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: RichText(
                  text: TextSpan(
                    text: 'Lave seu ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.8,
                      color: Color.fromRGBO(26, 26, 26, 1),
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'rosto ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.8,
                          color: Color.fromRGBO(219, 88, 143, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'com um sabonete para o rosto e espere de ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.8,
                          color: Color.fromRGBO(26, 26, 26, 1),
                        ),
                      ),
                      TextSpan(
                        text: '15 - 30 minutos.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.8,
                          color: Color.fromRGBO(219, 88, 143, 1),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Text(
                  'Escolha uma frase abaixo que seja correspondente com o que vê',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.8,
                    color: Color.fromRGBO(26, 26, 26, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 300.0,
                  height: 300.0,
                  child: Image.asset('lib/img/face.png', fit: BoxFit.fitWidth),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizEnd(skinType: 'seca')),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Parece ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'apertado & desidratado. ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'Ate quebradiço',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                    ],
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
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizEnd(skinType: 'oleosa')),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Parece ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'brilhante ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      TextSpan(
                        text: '& tem sensação ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'grudenta ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'ao toque',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                    ],
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
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizEnd(skinType: 'mista')),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Seco ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'em algumas áreas, porem ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'brilhante ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'em outras',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                    ],
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
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizEnd(skinType: 'normal')),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Sensação ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'suave',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      TextSpan(
                        text: ', balanceada & ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'saúdavel',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                    ],
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
            ],
          ),
        ),
      ),
    );
  }
}
