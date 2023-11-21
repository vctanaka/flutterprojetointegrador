import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_saga/controllers/ApiClient.dart';
import 'package:skin_saga/pages/coupon.dart';
import 'package:skin_saga/pages/home.dart';
import 'package:skin_saga/pages/mission.dart';
import 'package:skin_saga/pages/pointshistory.dart';

class Tools {
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('authToken');
    return token ?? '';
  }

  Future<dynamic> getLoginId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonLogin = await prefs.getString('jsonLogin');
    Map<String, dynamic> jsonArray = json.decode(jsonLogin ?? '');
    var id = jsonArray['login']['id'];

    return id;
  }

  Future<bool> refreshLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id = await getLoginId();
    var apiClient = ApiClient();
    apiClient.fetchAuth('getLoginFilter', {
      'id': id.toString(),
    }).then((value) {
      if (value.statusCode == 200) {
        prefs.setString('jsonLogin', value.body);
      } else {
        print('erro');
      }
    });
    return true;
  }

  Widget waitBuilder(
      Future<dynamic> future, Widget Function(dynamic data) buildW) {
    return FutureBuilder<dynamic>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildW(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
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
        //  CircularProgressIndicator();
      },
    );
  }

  void bottomMenu(int index, BuildContext context) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Mission()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Coupon()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PointsHistory()),
      );
    }
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
