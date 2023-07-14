import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/character.dart';
import '../../utils/providers.dart';
import '../widgets/body_builder.dart';
import '../widgets/character_card.dart';

class CharacterScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(homeProvider);
    return BodyBuilder(
      apiRequestStatus: viewModel.requestStatus,
      loadingWidget: Center(child: CircularProgressIndicator()),
      reload: () => viewModel.getCharacters(),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          if (viewModel.characters?.results?.isNotEmpty == true) {
            Character? character = viewModel
                .characters; //hilangkan "as Character?" jika tidak bisa
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              child: CharacterCard(character: character),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
