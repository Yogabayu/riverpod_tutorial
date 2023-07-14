import 'package:flutter/material.dart';
import 'package:riverpod_tutorial/src/view/screens/character_screen.dart';
import 'package:riverpod_tutorial/src/view/screens/detail_screen.dart';
import 'package:riverpod_tutorial/src/view/screens/location_screen.dart';
import '../data/models/character.dart';
// import 'package:riverpod_tutorial/src/data/models/character.dart';

import '../utils/util.dart';
import '../data/service/network_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    getCharacters();
    notifyListeners();
  }

  int selectedMenu = 0;
  NetworkService service = NetworkService();
  Character? characters;
  APIRequestStatus requestStatus = APIRequestStatus.loading;
  BottomMenu bottomMenu = BottomMenu.character;
  List<Widget> pages = <Widget>[
    CharacterScreen(),
    DetailScreen(),
    LocationScreen(),
  ];
  List<BottomNavigationBarItem> buildThreeItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Character',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.location_on_outlined),
        label: 'Location',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book_outlined),
        label: 'Episode',
      ),
    ];
  }

  changeMenu(index) {
    selectedMenu = index;
    notifyListeners();
  }

  getCharacters() async {
    requestStatus = APIRequestStatus.loading;
    notifyListeners();
    try {
      Character body = await service.getCharacters();
      if (body.results!.length > 0) {
        characters = body;
        requestStatus = APIRequestStatus.loaded;
        notifyListeners();
      } else {
        requestStatus = APIRequestStatus.loading;
        notifyListeners();
      }
    } catch (e) {
      if (Util.isConnectionError(e)) {
        requestStatus = APIRequestStatus.connectionError;
        notifyListeners();
      } else {
        requestStatus = APIRequestStatus.error;
        notifyListeners();
      }
    }
  }
}

enum APIRequestStatus {
  unInitialized,
  loading,
  loaded,
  error,
  connectionError,
}

enum BottomMenu {
  character,
  location,
  episode,
}
