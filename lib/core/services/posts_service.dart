import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cheffy/app/app.locator.dart';
import 'package:cheffy/ui/views/posts/posts/domain/entities/create_booked_post_params.dart';
import 'package:cheffy/core/services/api/api.dart';
import 'package:cheffy/core/services/api/api_provider.dart';

class PostsService {
  // ignore: constant_identifier_names
  static const String TAG = 'PostsService';

  final Api _api = locator.get<ApiProvider>();

/*  Future<void> createPost(
      {required String name,
      String? overview,
      double rate = 0,
      String type = 'romantic',
      String? notes,
      double? partnerAmount,
      required String gender,
      List<XFile>? attachments,
      required int location}) async {
    var requestBody = CreatePostEntity();
    requestBody.name = name;
    requestBody.overview = overview ?? 'dummy';
    requestBody.type = type;
    requestBody.notes = notes;
    requestBody.rate = rate;
    requestBody.partnerAmount = partnerAmount;
    requestBody.gender = gender;
    requestBody.location = location;
    requestBody.attachments = await _uploadAttachments(attachments);

    await _api.create(requestBody);
  }*/

/*
  Future<List<int>> _uploadAttachments(List<XFile>? attachments) async {
    if (attachments != null) {
      final List<int> result = [];
      for (var att in attachments) {
        try {
          var res = await _api.uploadAttachment(att.path, att.name);
          result.add(res.id);
        } catch (e) {
          Log.d(TAG, e.toString(), references: ['_uploadAttachments']);
        }
      }
      return result;
    }

    return [];
  }
*/
}
