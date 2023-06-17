# apiip

A wrapper around the [apiip.net](https://apiip.net/) API, which provides an information lookup service for IPv4 and IPv6 addresses.

## Getting started

First, obtain an access key by creating an account at [https://apiip.net](https://apiip.net).

You can then use this key to access the API:
```dart
import 'package:apiip/apiip.dart';

void main() {
  final client = Apiip('ACCESS_KEY', useHttps: false); // HTTPS is not available for free tier users.

  print((await client.lookupSelf()).countryName);
}
```
