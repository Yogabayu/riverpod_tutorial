import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/home_viewmodel.dart';

final homeProvider = ChangeNotifierProvider((_) => HomeViewModel());

// final seledtedBottomMenu = Provider<int>((ref) => 0);
