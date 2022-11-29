import 'package:cheffy/core/services/api/api_client.dart';
import 'package:cheffy/core/services/api/api_routes.dart';
import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/main/discover/domain/repositories/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<HotelEntity>> getAllHotels() async {
    final res = await _apiClient.get(ApiRoutes.allHotels);
    final List<HotelEntity> hotels =
        (res.data as List).map((e) => HotelEntity.fromMap(e)).toList();
    return hotels;
  }

  @override
  Future<List<HotelEntity>> getFilteredHotelsByName(String name) async {
    final res = await _apiClient.get(ApiRoutes.filteredHotels(name: name));
    final List<HotelEntity> hotels =
        (res.data as List).map((e) => HotelEntity.fromMap(e)).toList();
    return hotels;
  }
}
