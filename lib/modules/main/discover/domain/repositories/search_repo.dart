import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_location_entity.dart';

abstract class SearchRepo {
  Future<List<HotelLocationEntity>> getHotelsLocationByName(String name);
  Future<List<HotelEntity>> getFilteredHotels({
    required String checkInDate,
    required String checkOutDate,
    required int adultsNo,
    required int roomsNo,
    required HotelLocationEntity hotelLocation,
  });
}
