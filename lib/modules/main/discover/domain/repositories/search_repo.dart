import 'package:cheffy/modules/main/discover/domain/entities/booking_hotel_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_details.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_location_entity.dart';

abstract class SearchRepo {
  Future<List<HotelLocationEntity>> getHotelsLocationByName(String name);
  Future<BookingHotelDetailsEntity> getHotelDetailsById(int id);
  Future<List<BookingHotelEntity>> getFilteredHotels({
    required String checkInDate,
    required String checkOutDate,
    required int adultsNo,
    required int roomsNo,
    required HotelLocationEntity hotelLocation,
  });
}
