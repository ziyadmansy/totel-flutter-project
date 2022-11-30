import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/core/services/api/booking_api_client.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_location_entity.dart';
import 'package:cheffy/modules/main/discover/domain/repositories/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl(this._apiClient);

  final BookingApiClient _apiClient;

  @override
  Future<List<HotelLocationEntity>> getHotelsLocationByName(String name) async {
    final res = await _apiClient.get(ApiRoutes.searchHotelsLocationByName(
      name: name,
    ));
    final List<HotelLocationEntity> locations =
        (res.data as List).map((e) => HotelLocationEntity.fromMap(e)).toList();
    return locations;
  }

  @override
  Future<List<HotelEntity>> getFilteredHotels({
    required String checkInDate,
    required String checkOutDate,
    required int adultsNo,
    required int roomsNo,
    required HotelLocationEntity hotelLocation,
  }) async {
    final res = await _apiClient.get(ApiRoutes.filteredHotels(
      checkInDate: checkInDate,
      checkOutDate: checkOutDate,
      hotelLocation: hotelLocation,
      adultsNo: adultsNo,
      roomsNo: roomsNo,
    ));
    final List<HotelEntity> hotels =
        (res.data as List).map((e) => HotelEntity.fromMap(e)).toList();
    return hotels;
  }
}
