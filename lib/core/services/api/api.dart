import 'package:cheffy/core/models/data/bidding_entity.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:cheffy/core/models/data/locations_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/post_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/create_booked_post_params.dart';
import 'package:cheffy/core/models/response/base_entity.dart';
import 'package:cheffy/core/models/response/posts_entity.dart';
import 'package:cheffy/modules/auth/auth/domain/entities/profile_entity.dart';
import 'package:cheffy/modules/posts/posts/domain/entities/upload_attachment_entity.dart';

import '../../models/response/login_entity.dart';

abstract class Api {
  Fresh<OAuth2Token> get fresh;

/*
*/





  Future<List<LocationEntity>> locations();

  // Future<List<BiddingEntity>> biddings();
}
