import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_tutorial/src/data/models/character.dart';

import '../../utils/constants.dart';

class NetworkService {
  Future<Character> getCharacters() async {
    var res = await http.get(Uri.parse(characterUrl));
    if (res.statusCode == 200) {
      // print(res.body);
      return Character.fromJson(jsonDecode(res.body));
    } else {
      throw (jsonDecode(res.body));
    }
  }
}
