import 'dart:io';

import 'package:apiip/apiip.dart';
import 'package:test/test.dart';

void main() {
  final accessKey = Platform.environment['APIIP_KEY'];

  test(
    'lookupSelf',
    skip: accessKey == null ? 'No access key provided' : false,
    () {
      expect(Apiip(accessKey!, useHttps: false).lookupSelf(), completes);
      expect(
        Apiip(accessKey, useHttps: false).lookupSelf(language: Language.fr),
        completes,
      );
    },
  );

  test(
    'lookup',
    skip: accessKey == null ? 'No access key provided' : false,
    () {
      expect(Apiip(accessKey!, useHttps: false).lookup('8.8.8.8'), completes);
      expect(
        Apiip(accessKey, useHttps: false)
            .lookup('8.8.8.8', language: Language.fr),
        completes,
      );
    },
  );
}
