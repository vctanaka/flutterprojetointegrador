import 'package:flutter/material.dart';

class ComponentInput extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  ComponentInput({required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 211, 227, 1), // Set the fill color here
          borderRadius:
              BorderRadius.circular(10.0), // Set the border radius here
        ),
        child: Center(
          child: TextField(
            controller: controller,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 18,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Remove the border
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 15,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ),
      ),
    );
  }
}
