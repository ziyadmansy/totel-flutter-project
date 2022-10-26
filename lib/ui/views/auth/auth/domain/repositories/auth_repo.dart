import 'package:cheffy/core/failures/failures.dart';
import 'package:cheffy/core/models/response/login_entity.dart';
import 'package:cheffy/ui/views/auth/auth/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, ProfileEntity>> login(String username, String password);

}
