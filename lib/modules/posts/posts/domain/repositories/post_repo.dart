import 'package:cheffy/modules/posts/posts/domain/entities/create_finding_post_params.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_booked_post_params.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/attachment_entity.dart';
import 'package:image_picker/image_picker.dart';

abstract class PostRepo {
  Future<void> createBookedPost(CreateBookedPostParams entity,
      {List<XFile> files = const []});

  Future<void> createFindingPost(
    CreateFindingPostParams entity,
  );

  Future<PostsEntity> getAllPosts();

  

  Future<AttachmentEntity> uploadAttachment(String path, String fileName);
}
