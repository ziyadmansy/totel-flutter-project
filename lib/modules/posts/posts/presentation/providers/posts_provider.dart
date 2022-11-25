import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/category_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/share_room_post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/repositories/post_repo.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PostsProvider extends BaseViewModel {
  final NavigationService _navigationService = locator.get();

  final PostRepo postRepo;

  PostsProvider(this.postRepo);

  FindingPartnerPostsEntity? findingPartnerPostEntity;
  ShareRoomPostEntity? shareRoomPostEntity;

  List<CategoryEntity> categories = [];

   Future<void> getCategories() async {
    try {
      setBusyForObject(categories, true);
      categories = await postRepo.getCategories();
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      setBusyForObject(categories, false);
    }
  }

  Future<void> getFindingPartnerPosts() async {
    try {
      setBusyForObject(findingPartnerPostEntity, true);
      findingPartnerPostEntity = await postRepo.getAllFindingPartnerPosts();
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      setBusyForObject(findingPartnerPostEntity, false);
    }
  }

  Future<void> getShareRoomPosts() async {
    try {
      setBusyForObject(shareRoomPostEntity, true);
      shareRoomPostEntity = await postRepo.getAllShareRoomPosts();
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      setBusyForObject(shareRoomPostEntity, false);
    }
  }

  void onTapFindingPartnerPost(FindingPartnerPost selectedPost) {
    _navigationService.navigateTo(
      Routes.postDetailView,
      arguments: PostDetailViewArguments(post: selectedPost),
    );
  }

  void onTapShareRoomPost(ShareRoomPost selectedPost) {
    _navigationService.navigateTo(
      Routes.postDetailView,
      // arguments: PostDetailViewArguments(post: selectedPost),
    );
  }
}
