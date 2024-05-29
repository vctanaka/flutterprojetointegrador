import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_url/open_url.dart';
import 'package:skin_saga/components/component_menu.dart';
import 'package:skin_saga/controllers/ApiClient.dart';
import 'package:skin_saga/controllers/Tools.dart';
import 'package:skin_saga/pages/history.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:skin_saga/pages/pointshistory.dart';

class Coupon extends StatefulWidget {
  const Coupon({super.key});

  @override
  State<Coupon> createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  int _currentIndex = 2;

  final String urlRedirect = 'https://www.instagram.com/marictanaka/';

  Future<int> getPoints() async {
    ApiClient apiClient = ApiClient();
    var id = await Tools().getLoginId();
    var response = await apiClient.fetchAuth('getPoints', {
      'id': id.toString(),
    });
    var respDecode = json.decode(response.body);
    return respDecode;
  }

  Future<List<dynamic>> getCoupons() async {
    ApiClient apiClient = ApiClient();
    var id = await Tools().getLoginId();
    var response = await apiClient.fetchAuth('getCoupon', {
      'id': id.toString(),
    });
    var respDecode = json.decode(response.body);

    return respDecode;
  }

  void setCoupons(int idCoupon) async {
    ApiClient apiClient = ApiClient();
    var id = await Tools().getLoginId();
    var response = await apiClient.fetchAuth('redeemed_coupons', {
      'login_id': id.toString(),
      'coupon_id': idCoupon.toString(),
    });
    var respDecode = json.decode(response.body);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Coupon()),
    );
  }

  Future<void> _launchUrl() async {
    final result = await openUrl(urlRedirect);
    if (result.exitCode == 0) {
      print('URL should be open in your browser');
    } else {
      print('Something went wrong (exit code = ${result.exitCode}): '
          '${result.stderr}');
    }
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
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    'Cupons de Desconto',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(26, 26, 26, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Center(
                    child: Text(
                      'Tem duvidas? Entre em Contato com uma especialista',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(26, 26, 26, 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Row(
                  children: ([
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 245, 250, 1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: Image.asset(
                            'assets/images/esteticista.png',
                            width: 50,
                            height: 50,
                          )),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'Enfermeira Esteticista',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(26, 26, 26, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Ma. Mariana Tanaka',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(26, 26, 26, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: ElevatedButton(
                          onPressed: () => _launchUrl(),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(255, 245, 250, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Contato',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(219, 88, 143, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Row(
                  children: ([
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        'Total de Pontos',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(26, 26, 26, 1),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PointsHistory()),
                          );
                        },
                        child: Tools().waitBuilder(
                          getPoints(),
                          (value) => Text(
                            value.toString() + ' Pontos',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(219, 88, 143, 1),
                            ),
                          ), //TODO
                        ),
                      ),
                    ),
                    Spacer(),
                  ]),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Expanded(
                  child: Tools().waitBuilder(
                    getCoupons(),
                    (value) {
                      return GroupedListView<dynamic, String>(
                        elements: value,
                        groupBy: (element) => element['store'],
                        groupSeparatorBuilder: (String groupByValue) => Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                groupByValue,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(26, 26, 26, 1),
                                ),
                              ),
                            ],
                          ),
                        ),

                        itemBuilder: (context, dynamic element) => Container(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 230,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(248, 248, 248, 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: RichText(
                                          textAlign: TextAlign.start,
                                          text: TextSpan(
                                            text: element['coupon_id'] != null
                                                ? element['code']
                                                : '* * * * * *',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Color.fromRGBO(26, 26, 26, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 10, 0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (element['coupon_id'] != null) {
                                            Tools().copyToClipboard(
                                                element['code'].toString());
                                          } else {
                                            setCoupons(element['id']);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(255, 245, 250, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          element['coupon_id'] != null
                                              ? 'Copiar'
                                              : element['value'].toString() +
                                                  ' Pontos',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Color.fromRGBO(219, 88, 143, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        useStickyGroupSeparators: false, // optional
                        floatingHeader: false, // optional
                        order: GroupedListOrder.ASC, // optional
                      );
                    },
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
