import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/main/map/domain/repositories/maps_repo.dart';

class MapsRepoImpl implements MapsRepo {
  MapsRepoImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<HotelEntity>> getHotelsByCoordinates(
      {required double lon, required double lat}) async {
    final res = await _apiClient.get(ApiRoutes.hotelsByCoordinates(
      lon: lon,
      lat: lat,
    ));
    final List<HotelEntity> hotels =
        (res.data as List).map((e) => HotelEntity.fromMap(e)).toList();
    return hotels;
  }
}
