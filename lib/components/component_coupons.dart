import 'package:flutter/material.dart';

class ComponentCoupons extends StatelessWidget {
  final String couponCode;
  final String couponValue;

  ComponentCoupons({
    required this.couponCode,
    required this.couponValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Center(
                child: Container(
                  // width: 330,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 245, 250, 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            // width: 45,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: couponCode,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(51, 51, 51, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 45,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 98, 153, 1),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: couponValue,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
