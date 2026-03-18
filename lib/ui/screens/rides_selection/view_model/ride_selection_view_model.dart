import 'package:flutter/material.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:blabla/data/repositories/rides_repository/ride_repository.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;
  final RideRepository rideRepository;

  RidesSelectionViewModel({
    required this.ridePreferenceState,
    required this.rideRepository,
  }) {
    ridePreferenceState.addListener(notifyListeners);
  }

  RidePreference? get selectedRidePreference =>
      ridePreferenceState.selectedPreference;

  List<RidePreference> get history => ridePreferenceState.historyPreference;

  List<Ride> get matchingRides {
    final rides = rideRepository.getRide();
    final preference = selectedRidePreference;

    if (preference == null) return [];

    return rides.where((ride) {
      return ride.departureLocation == preference.departure &&
          ride.arrivalLocation == preference.arrival &&
          ride.availableSeats >= preference.requestedSeats;
    }).toList();
  }

  void selectRidePreference(RidePreference preference) {
    ridePreferenceState.selectPreference(preference);
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}
