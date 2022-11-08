import 'package:cheffy/core/models/data/bidding_entity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/core/services/api/api.dart';
import 'package:cheffy/core/services/api/api_provider.dart';

class BiddingService {
  final Api _api = locator.get<ApiProvider>();

  // Future<List<BiddingEntity>> getBiddings() {
  //   return _api.biddings();
  // }
}
