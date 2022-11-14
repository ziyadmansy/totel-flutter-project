import 'dart:io';

import 'package:cheffy/Models/occupation.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';

abstract class ProfileRepo {
  Future<UserEntity> get();

  Future<List<Occupation>> getOccupations();

  Future<UserEntity> update(UserEntity profileEntity, {File? newAvatar});
}
