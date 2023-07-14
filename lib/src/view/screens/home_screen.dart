import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/constants.dart';
import '../../utils/providers.dart';

class HomeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("$appName"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.selectedMenu,
        onTap: (index) {
          viewModel.changeMenu(index);
        },
        items: viewModel.buildThreeItems(),
      ),
      body: viewModel.pages[viewModel.selectedMenu],
    );
  }
}
