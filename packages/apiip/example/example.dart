import 'dart:io';

import 'package:apiip/apiip.dart';

void main() async {
  final apiip = Apiip(Platform.environment['ACCESS_KEY']!, useHttps: false);

  final result = await apiip.lookup('8.8.8.8');

  print(result.countryName); // United States
}
