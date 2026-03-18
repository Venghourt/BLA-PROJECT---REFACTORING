import 'package:blabla/data/repositories/ride_preference_repository/ride_preference_repository.dart';
import 'package:flutter/material.dart';
import '../../model/ride_pref/ride_pref.dart';

class RidePreferenceState extends ChangeNotifier {
  
  final RidePreferenceRepository repository;

  RidePreference? _selectedPreference;

  static const int maxAllowedSeats = 8;

  RidePreferenceState({required this.repository});

  RidePreference? get selectedPreference => _selectedPreference;

  List<RidePreference> get historyPreference {
    return repository.getPreference();
  }

  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;
      repository.addPreference(preference);
      notifyListeners();
    }
  }
}
