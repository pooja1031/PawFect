// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<String>> fetchDogBreeds() async {
  final response =
      await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<String> breeds = data['message'].keys.toList();
    return breeds;
  } else {
    throw Exception('Failed to fetch dog breeds');
  }
}
