import 'package:flutter/material.dart';
import 'package:new_project/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen1 extends StatelessWidget {
  Screen1({super.key});
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Person"),
      ),
      body: SafeArea(

          /*ListView.separated(
          itemBuilder: (context, index) {
            return 
            ListTile(
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
        ),*/
          child: Column(
        children: [
          TextFormField(
            controller: _textController,
          ),
          ElevatedButton(
            onPressed: () {
              saveDataToStorage();
            },
            child: Text(
              'Save Value',
            ),
          )
        ],
      )),
    );
  }

  Future<void> saveDataToStorage() async {
    print(_textController);

    // Shared Preference

    final sharedPrefs = await SharedPreferences.getInstance();

    //Save value
    await sharedPrefs.setString('saved_value', _textController.text);
  }
}
