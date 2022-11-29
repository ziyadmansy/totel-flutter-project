import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';

abstract class SearchRepo {
  Future<List<HotelEntity>> getAllHotels();
  Future<List<HotelEntity>> getFilteredHotelsByName(String name);
}
