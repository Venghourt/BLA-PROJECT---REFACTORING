import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:blabla/data/repositories/rides_repository/ride_repository.dart';
import 'view_model/ride_selection_view_model.dart';
import 'widgets/ride_selection_content.dart';

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RidesSelectionViewModel(
        ridePreferenceState: context.read<RidePreferenceState>(),
        rideRepository: context.read<RideRepository>(),
      ),
      child: Consumer<RidesSelectionViewModel>(
        builder: (context, viewModel, child) {
          return RidesSelectionContent(viewModel: viewModel);
        },
      ),
    );
  }
}
