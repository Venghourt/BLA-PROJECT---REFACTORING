import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride_preference_repository/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock extends RidePreferenceRepository {
  List<RidePreference> ridePreferences = fakeRidePrefs;

  @override
  void addPreference(RidePreference preference) {
    ridePreferences.add(preference);
  }

  @override
  List<RidePreference> getPreference() {
    return ridePreferences;
  }
}
