import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'view_model/home_view_model.dart';
import 'widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  HomeViewModel? viewModel;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (viewModel == null) {
      final RidePreferenceState ridePreferenceState = context
          .read<RidePreferenceState>();

      viewModel = HomeViewModel(ridePreferenceState: ridePreferenceState);
    }

    return HomeContent(viewModel: viewModel!);
  }
}
