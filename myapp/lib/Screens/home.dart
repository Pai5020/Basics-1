import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 10,
          title: Text(
            'BASIC APP',
            style: TextStyle(fontSize: 12.0),
          ),
          leading: IconButton(
            onPressed: () {
              print("Button pressed!!");
            },
            icon: Icon(Icons.menu),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/basicWidget');
                  },
                  child: Text(
                    "Basic Widget",
                  )),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/multiChildWidget');
                  },
                  child: Text(
                    "multi ChildWidget",
                  )),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/imageWidget');
                  },
                  child: Text(
                    "Image Widget",
                  )),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/textWidget');
                  },
                  child: Text(
                    "Text Widget",
                  )),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/textFieldWidget');
                  },
                  child: Text(
                    "Text Field Widget",
                  )),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/listViewWidget');
                  },
                  child: Text(
                    "List View Widget",
                  )),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/gridViewWidget');
                  },
                  child: Text(
                    "Grid View Widget",
                  )),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/stackWidget');
                  },
                  child: Text(
                    "Stack Widget",
                  )),
            ],
          ),
        ));
  }
}
