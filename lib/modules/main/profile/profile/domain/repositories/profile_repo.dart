import 'dart:io';

import 'package:cheffy/Models/occupation.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/user_entity.dart';
import 'package:cheffy/modules/main/profile/profile/domain/entities/booking_entity.dart';
import 'package:cheffy/modules/main/profile/profile/domain/entities/review_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';

abstract class ProfileRepo {
  Future<UserEntity> get();

  Future<PostsEntity> getUserPosts();
  Future<List<ReviewEntity>> getUserReviews();
  Future<List<BookingEntity>> getUserBookings();

  Future<void> deletePostById(int postId);

  Future<List<Occupation>> getOccupations();

  Future<UserEntity> update(UserEntity profileEntity, {File? newAvatar});
}
