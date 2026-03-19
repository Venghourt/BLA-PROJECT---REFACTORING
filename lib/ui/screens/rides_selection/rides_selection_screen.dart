import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:blabla/data/repositories/rides_repository/ride_repository.dart';
import 'view_model/ride_selection_view_model.dart';
import 'widgets/ride_selection_content.dart';

class RidesSelectionScreen extends StatelessWidget {
  RidesSelectionViewModel? viewModel;
  RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if(viewModel == null){
      final RidePreferenceState ridePreferenceState = context
              .read<RidePreferenceState>();
          final RideRepository rideRepository = context.read<RideRepository>();
          viewModel = RidesSelectionViewModel(
            ridePreferenceState: ridePreferenceState,
            rideRepository: rideRepository,
          );
    }
    
    return RidesSelectionContent(viewModel: viewModel!);
  }
}
