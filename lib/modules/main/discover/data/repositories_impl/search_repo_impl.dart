// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/core/services/api/booking_api_client.dart';
import 'package:cheffy/modules/main/discover/domain/entities/booking_hotel_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/check_details.dart';
import 'package:cheffy/modules/main/discover/domain/entities/check_in_out_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_details.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_location_entity.dart';
import 'package:cheffy/modules/main/discover/domain/repositories/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl(
    this._bookingApiClient,
    this._apiClient,
  );

  final BookingApiClient _bookingApiClient;
  final ApiClient _apiClient;

  @override
  Future<List<HotelLocationEntity>> getHotelsLocationByName(String name) async {
    final res =
        await _bookingApiClient.get(ApiRoutes.searchHotelsLocationByName(
      name: name,
    ));
    final List<HotelLocationEntity> locations =
        (res.data as List).map((e) => HotelLocationEntity.fromMap(e)).toList();
    return locations;
  }

  @override
  Future<List<BookingHotelEntity>> getFilteredHotels({
    required String checkInDate,
    required String checkOutDate,
    required int adultsNo,
    required int roomsNo,
    required HotelLocationEntity hotelLocation,
  }) async {
    final res = await _bookingApiClient.get(ApiRoutes.filteredHotels(
      checkInDate: checkInDate,
      checkOutDate: checkOutDate,
      hotelLocation: hotelLocation,
      adultsNo: adultsNo,
      roomsNo: roomsNo,
    ));
    final List<BookingHotelEntity> hotels = (res.data['result'] as List)
        .map((e) => BookingHotelEntity.fromMap(e))
        .toList();
    return hotels;
  }

  Future<BookingHotelDetailsEntity> getHotelDetailsById(int id) async {
    final res = await _bookingApiClient.get(ApiRoutes.getHotelData(id));
    return BookingHotelDetailsEntity.fromMap(res.data);
  }

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
  }) async {
    await _apiClient.post(
      ApiRoutes.createBooking,
      data: {
        "hotel": {
          "hotel_id": hotelId,
          "district": district,
          "hotel_name": hotelName,
          "country": country,
          "city": city,
          "is_vacation_rental": isVacationRental,
          "children_not_allowed": childrenNotAllowed,
          "minrate": minrate,
          "maxrate": maxrate,
          "url": url,
          "address": address,
          "countrycode": countrycode,
          "email": email,
          "review_score": reviewScore,
          "review_score_word": reviewScoreWord,
          "currencycode": currencycode,
          "accommodation_type_name": accommodationTypeName,
          "distance": distance,
          "is_free_cancellable": isFreeCancellable,
          "main_photo_url": mainPhotoUrl,
          "zip": zip,
          "latitude": latitude,
          "longitude": longitude,
          "location": {
            "latitude": latitude,
            "longitude": longitude,
          },
          "entrance_photo_url": entrancePhotoUrl,
          "checkin": checkin.toMap(),
          "checkout": checkout.toMap(),
        },
        "amount": amount,
        "currency": currency,
        "check_in_date": checkInDate,
        "check_out_date": checkOutDate,
        "no_of_rooms": noOfRooms,
        "room_type": roomType,
        "payment_option": paymentOption,
        "booking_status": bookingStatus,
      },
    );
  }
}
