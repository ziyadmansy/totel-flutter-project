import 'package:cheffy/core/models/data/bidding_entity.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/core/models/data/post_entity.dart';
import 'package:cheffy/core/models/request/create_post_entity.dart';
import 'package:cheffy/core/models/response/base_entity.dart';
import 'package:cheffy/core/models/response/posts_entity.dart';
import 'package:cheffy/core/models/response/profile_entity.dart';
import 'package:cheffy/core/models/response/upload_attachment_entity.dart';

import '../../models/response/login_entity.dart';

abstract class Api {
  Fresh<OAuth2Token> get fresh;

  Future<LoginEntity> login(String username, String password);

  Future<ProfileEntity> profile();

  Future<BaseEntity> createPost(CreatePostEntity entity);

  Future<PostsEntity> posts();

  Future<List<PostEntity>> post(int postId);

  Future<UploadAttachmentEntity> uploadAttachment(String path, String fileName);

  Future<List<LocationEntity>> locations();

  Future<List<BiddingEntity>> biddings();
}
