import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'view_model/home_view_model.dart';
import 'widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(
        ridePreferenceState: context.read<RidePreferenceState>(),
      ),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return HomeContent(viewModel: viewModel);
        },
      ),
    );
  }
}
