import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';

abstract class MapsRepo {
  Future<List<HotelEntity>> getHotelsByCoordinates(
      {required double lon, required double lat});
}
