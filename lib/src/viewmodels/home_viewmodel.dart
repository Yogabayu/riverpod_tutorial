import 'package:flutter/foundation.dart';

import '../utils/util.dart';
import '../data/service/network_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    getCharacters();
  }

  NetworkService service = NetworkService();
  List characters = [];
  APIRequestStatus requestStatus = APIRequestStatus.loading;

  getCharacters() async {
    requestStatus = APIRequestStatus.loading;
    notifyListeners();
    try {
      Map body = await service.getCharacters();
      characters = body['results'];
      requestStatus = APIRequestStatus.loaded;
      notifyListeners();
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
