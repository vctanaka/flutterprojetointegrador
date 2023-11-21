import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skin_saga/components/component_menu.dart';
import 'package:skin_saga/components/component_points.dart';
import 'package:skin_saga/controllers/ApiClient.dart';
import 'package:skin_saga/controllers/Tools.dart';
import 'package:skin_saga/pages/history.dart';
import 'package:skin_saga/pages/home.dart';
import 'package:skin_saga/pages/mission.dart';
import 'package:skin_saga/pages/points.dart';

class PointsHistory extends StatefulWidget {
  const PointsHistory({super.key});

  @override
  State<PointsHistory> createState() => _PointsHistoryState();
}

class _PointsHistoryState extends State<PointsHistory> {
  int _currentIndex = 3;

  Future<List<dynamic>> getPointsHistory() async {
    ApiClient apiClient = ApiClient();
    var id = await Tools().getLoginId();
    var response = await apiClient.fetchAuth('getHistory', {
      'id': id.toString(),
    });
    var respDecode = json.decode(response.body);

    return respDecode;
  }

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
          // child: Expanded(
          child: Column(
            children: [
              // Container(
              // child: Expanded(
              // child:
              Text(
                'Histórico de Pontos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(26, 26, 26, 1),
                ),
              ),
              // ),
              // ),
              SizedBox(height: 15),
              Container(
                child: Expanded(
                  child: Tools().waitBuilder(
                    getPointsHistory(),
                    (value) {
                      return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return ComponentPoints(
                            pointsTitle: value[index]["description"],
                            pointsNumber: value[index]["point"].toString(),
                            pointsOp: value[index]["op"],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          // ),
        ),
      ),
    );
  }
}
