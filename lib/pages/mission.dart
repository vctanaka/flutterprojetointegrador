import 'package:flutter/material.dart';
import 'package:skin_saga/components/component_menu.dart';
import 'package:skin_saga/components/component_mission.dart';
import 'package:skin_saga/controllers/ApiClient.dart';
import 'package:skin_saga/controllers/Tools.dart';
import 'package:skin_saga/pages/history.dart';
import 'package:skin_saga/pages/home.dart';
import 'package:skin_saga/pages/points.dart';

class Mission extends StatefulWidget {
  const Mission({super.key});

  @override
  State<Mission> createState() => _MissionState();
}

class _MissionState extends State<Mission> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        bottomNavigationBar: ComponentMenu(
          currentIndex: _currentIndex,
          onTap: (index) => Tools().bottomMenu(index, context),
        ),
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    'Missões Diárias',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(26, 26, 26, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Expanded(
                    child: Tools().waitBuilder(
                  ApiClient().getApiBuild('getMissions'),
                  (value) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return ComponentMission(
                          missionTitle: value[index]['name'],
                          missionDescription: value[index]['description'],
                          idMission: value[index]['id'].toString(),
                          missionDone: (value[index]['completed'] != null
                              ? true
                              : false),
                        );
                      },
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
