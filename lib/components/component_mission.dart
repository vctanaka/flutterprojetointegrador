import 'package:flutter/material.dart';
import 'package:skin_saga/pages/mission.dart';

class ComponentMission extends StatelessWidget {
  final String missionTitle;
  final String missionDescription;
  bool missionDone = true;

  ComponentMission(
      {required this.missionTitle,
      required this.missionDescription,
      required this.missionDone});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Center(
              child: Container(
                width: 330,
                height: 90,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 245, 250, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: missionTitle,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                      ),
                      Spacer(),
                      if (missionDone)
                        Icon(Icons.favorite,
                            color: Color.fromRGBO(229, 98, 153, 1))
                      else
                        Icon(Icons.favorite_border_outlined,
                            color: Color.fromRGBO(122, 122, 122, 1)),
                    ]),
                    SizedBox(height: 5),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: missionDescription,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(122, 122, 122, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
