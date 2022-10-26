import 'package:cheffy/core/failures/failures.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/core/services/api/api_client.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {

  Future<Either<Failure, ProfileEntity>> get();
}
