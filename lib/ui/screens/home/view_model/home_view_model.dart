import 'package:flutter/material.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;

  HomeViewModel({required this.ridePreferenceState}) {
    ridePreferenceState.addListener(notifyListeners);
  }

  RidePreference? get selectedPreference =>
      ridePreferenceState.selectedPreference;

  List<RidePreference> get history =>
      ridePreferenceState.historyPreference.reversed.toList();

  void selectRidePreference(RidePreference preference) {
    ridePreferenceState.selectPreference(preference);
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}
