import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Imagewidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              child: Image.asset(
                "assets/image1.jpg",
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20),
            // Add some space between the images if needed
            Container(
              height: 200,
              width: 200,
              child: Image.network(
                "https://www.businessofapps.com/wp-content/uploads/2020/08/zymr8_steps_the_mobile_app_dev_lifecycle_cover.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
