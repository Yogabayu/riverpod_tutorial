import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils/constants.dart';

class NetworkService {
  Future<Map> getCharacters() async {
    var res = await http.get(Uri.parse(characterUrl));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw (jsonDecode(res.body));
    }
  }
}
