import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/rides_repository/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';

class RideRepositoryMock extends RideRepository {
  @override
  List<Ride> getRide(){
    return fakeRides;
  }
}
