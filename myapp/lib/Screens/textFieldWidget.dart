import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Textfieldwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextField(
            keyboardType: TextInputType.text,
            onChanged: (String textValue) {
              print("Output: " + textValue);
            },
            onTap: () {
              print("Tapped!! :) ");
            },
            maxLines: 10,
            //enabled: false,
            controller: TextEditingController(text: "Default Values"),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 4),
                //borderRadius: BorderRadius.circular(20),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),

              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 4),
                borderRadius: BorderRadius.circular(20),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 4),
                //borderRadius: BorderRadius.circular(20),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              icon: Icon(Icons.account_box, color: Colors.green),
              suffixIcon: Icon(Icons.more),
              contentPadding: EdgeInsets.all(20),
              labelText: "Username",
              labelStyle: TextStyle(
                color: Colors.brown,
                fontSize: 20,
              ),
              hintText: "Hint Text ",
              helperText: "Please enter your username",
              //suffixText: "OK",
              suffix: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: Text("OK"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
