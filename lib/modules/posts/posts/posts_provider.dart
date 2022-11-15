import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/app/app.router.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/repositories/post_repo.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PostsProvider extends BaseViewModel {
  final NavigationService _navigationService = locator.get();

  final PostRepo postRepo;

  PostsProvider(this.postRepo);

  PostsEntity? postEntity;

  Future<void> getPosts() async {
    try {
      setBusy(true);
      postEntity = await postRepo.getAllPosts();
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      setBusy(false);
    }
  }

  void onTapPost(Post selectedPost) {
    _navigationService.navigateTo(
      Routes.postDetailView,
      arguments: selectedPost,
    );
  }
}
