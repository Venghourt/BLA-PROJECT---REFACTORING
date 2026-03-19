import 'package:provider/provider.dart';
import 'main_common.dart';

import 'data/repositories/locations_repository/location_repository.dart';
import 'data/repositories/locations_repository/location_repository_mock.dart';
import 'data/repositories/rides_repository/ride_repository.dart';
import 'data/repositories/rides_repository/ride_repository_mock.dart';
import 'data/repositories/ride_preference_repository/ride_preference_repository.dart';
import 'data/repositories/ride_preference_repository/ride_preference_repository_mock.dart';
import 'ui/states/ride_preference_state.dart';

List<InheritedProvider> get devProviders {
  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    Provider<RidePreferenceRepository>(
      create: (_) => RidePreferenceRepositoryMock(),
    ),
    ChangeNotifierProvider<RidePreferenceState>(
      create: (context) => RidePreferenceState(
        repository: context.read<RidePreferenceRepository>(),
      ),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
