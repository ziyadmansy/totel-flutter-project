import 'package:cheffy/modules/main/discover/domain/entities/booking_hotel_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/check_details.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_details.dart';
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

  Future<void> createBooking({
    required int hotelId,
    required String district,
    required String hotelName,
    required String country,
    required String city,
    required int isVacationRental,
    required int childrenNotAllowed,
    required double minrate,
    required double maxrate,
    required String url,
    required String address,
    required String countrycode,
    required String email,
    required double reviewScore,
    required String reviewScoreWord,
    required String currencycode,
    required String accommodationTypeName,
    required String distance,
    required int isFreeCancellable,
    required String mainPhotoUrl,
    required String zip,
    required double latitude,
    required double longitude,
    required String entrancePhotoUrl,
    required CheckDetailsEntity checkin,
    required CheckDetailsEntity checkout,
    required double amount,
    required String currency,
    required String checkInDate,
    required String checkOutDate,
    required int noOfRooms,
    required String roomType,
    required String paymentOption,
    required String bookingStatus,
  });
}
