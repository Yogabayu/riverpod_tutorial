import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hooks_riverpod/all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/character.dart';
import '../../utils/constants.dart';
import '../../utils/providers.dart';
import '../widgets/body_builder.dart';
import '../widgets/character_card.dart';

class HomeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("$appName"),
      ),
      body: BodyBuilder(
        apiRequestStatus: viewModel.requestStatus,
        loadingWidget: Center(child: CircularProgressIndicator()),
        reload: () => viewModel.getCharacters(),
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: viewModel.characters.length,
          itemBuilder: (BuildContext context, int index) {
            Character character =
                Character.fromJson(viewModel.characters[index]);
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              child: CharacterCard(character: character),
            );
          },
        ),
      ),
    );
  }
}
