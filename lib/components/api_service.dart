import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interndemo/components/combo_model.dart';
import 'package:interndemo/components/salad_model.dart';

Future<List<Combo>> fetchCombos() async {
  final response = await http.get(
      Uri.parse("https://api.mockaroo.com/api/f7bb5a50?count=20&key=dc231d70"));
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((combo) => Combo.fromJson(combo)).toList();
  } else {
    throw Exception('Failed to load combos');
  }
}

Future<List<Salad>> fetchSalads() async {
  final response = await http.get(
      Uri.parse("https://api.mockaroo.com/api/5727b6f0?count=20&key=dc231d70"));
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((salad) => Salad.fromJson(salad)).toList();
  } else {
    throw Exception('Failed to load salads');
  }
}
