import 'package:cheffy/modules/main/discover/domain/entities/hotel_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_finding_post_params.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_share_room_post_params.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/attachment_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/share_room_post_entity.dart';

abstract class PostRepo {
  Future<void> createShareRoomPost(
    CreateSharedRoomPostParams entity,
  );
  Future<void> createFindingPost(
    CreateFindingPartnerPostParams entity,
  );

  Future<FindingPartnerPostsEntity> getAllFindingPartnerPosts();
  Future<ShareRoomPostEntity> getAllShareRoomPosts();

  Future<List<HotelEntity>> getFilteredHotels(String name);

  Future<AttachmentEntity> uploadAttachment(String path, String fileName);
}
