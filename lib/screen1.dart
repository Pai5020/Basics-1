import 'package:flutter/material.dart';
import 'package:new_project/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Person"),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Person $index'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Screen2(name: 'Person $index'),
                ));
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: 30,
        ),
      ),
    );
  }
}
