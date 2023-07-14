import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_tutorial/src/data/models/location.dart';
import 'package:riverpod_tutorial/src/view/widgets/LocationCard.dart';

import '../../utils/providers.dart';
import '../widgets/body_builder.dart';

class LocationScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(homeProvider);
    return BodyBuilder(
      apiRequestStatus: viewModel.requestStatus,
      loadingWidget: Center(child: CircularProgressIndicator()),
      reload: () => viewModel.getLocation(),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          if (viewModel.locations?.results?.isNotEmpty == true) {
            Location? location =
                viewModel.locations; //hilangkan "as Character?" jika tidak bisa
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              child: LocationCard(location: location),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
