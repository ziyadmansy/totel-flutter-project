import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';

import '../../../app/app.dart';

class ApiKeyGen {
  // ignore: constant_identifier_names
  static const String TAG = 'ApiKeyGen';

  static KeyGen generate() {
    String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    String key;

    var encKey = utf8.encode(Application.encKey);
    var bytes = utf8.encode(timeStamp);

    var hmac = Hmac(sha256, encKey); // HMAC-SHA256
    var digest = hmac.convert(bytes);

    Log.i(TAG, 'HMAC digest as bytes: ${digest.bytes}',
        references: ['generate']);
    Log.i(TAG, 'HMAC digest as hex string: $digest', references: ['generate']);

    key = digest.toString();

    return KeyGen(timeStamp, key);
  }
}

class KeyGen {
  final String timeStamp;
  final String key;

  KeyGen(this.timeStamp, this.key);
}
