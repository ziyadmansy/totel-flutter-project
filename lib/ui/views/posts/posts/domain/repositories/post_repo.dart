import 'package:cheffy/core/models/data/bidding_entity.dart';
import 'package:cheffy/ui/views/posts/posts/domain/entities/create_finding_post_params.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/ui/views/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/ui/views/posts/posts/domain/entities/create_booked_post_params.dart';
import 'package:cheffy/core/models/response/base_entity.dart';
import 'package:cheffy/core/models/response/posts_entity.dart';
import 'package:cheffy/ui/views/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/ui/views/posts/posts/domain/entities/upload_attachment_entity.dart';
import 'package:image_picker/image_picker.dart';

abstract class PostRepo {
  Future<void> createBookedPost(CreateBookedPostParams entity,
      {List<XFile> files = const []});

  Future<void> createFindingPost(
    CreateFindingPostParams entity,
  );

  Future<PostsEntity> getAll();

  Future<PostEntity> get(int postId);

  Future<UploadAttachmentEntity> uploadAttachment(String path, String fileName);
}
