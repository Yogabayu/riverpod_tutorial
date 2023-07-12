import 'package:flutter/foundation.dart';
import 'package:riverpod_tutorial/src/data/models/character.dart';
// import 'package:riverpod_tutorial/src/data/models/character.dart';

import '../utils/util.dart';
import '../data/service/network_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    getCharacters();
    notifyListeners();
  }

  NetworkService service = NetworkService();
  Character? characters;
  APIRequestStatus requestStatus = APIRequestStatus.loading;

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
