import 'dart:io';

import 'package:cheffy/Models/occupation.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';

abstract class ProfileRepo {
  Future<ProfileEntity> get();

  Future<List<Occupation>> getOccupations();

  Future<ProfileEntity> update(ProfileEntity profileEntity, {File? newAvatar});
}
