import 'package:http/http.dart' as http;

Future<void> getNumberFact({required int number}) async {
  final _response = await http.get(Uri.parse("http://numbersapi.com/19?json"));
  print(_response.body);
}
