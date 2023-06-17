import 'package:apiip/src/apiip_client.dart';
import 'package:apiip/src/models/ip_information.dart';
import 'package:apiip/src/models/language.dart';

/// {@template apiip}
/// The client used to access the API.
/// {@endtemplate}
class Apiip {
  /// The access key used by this client to authenticate with the API.
  final String accessKey;

  /// The HTTP client used to perform requests.
  final ApiipClient client;

  /// Whether this client uses HTTPS.
  final bool useHttps;

  /// {@macro apiip}
  Apiip(this.accessKey, {this.useHttps = true})
      : client = ApiipClient(useHttps);

  /// Fetch information about the given IP address.
  ///
  /// {@template language_info}
  /// The language the results are returned in can be configured by providing
  /// [language].
  /// {@endtemplate}
  Future<IpInformation> lookup(String ip, {Language? language}) async {
    final uri = Uri(
      path: '/check',
      queryParameters: {
        'ip': ip,
        'accessKey': accessKey,
        if (language != null) 'language': language.toString()
      },
    );

    final response = await client.get(uri);
    return IpInformation.fromJson(response.jsonBody);
  }

  /// Fetch information about multiple IP addresses at once.
  ///
  /// {@macro language_info}
  Future<List<IpInformation>> bulkLookup(
    List<String> ips, {
    Language? language,
  }) async {
    final uri = Uri(
      path: '/check',
      queryParameters: {
        'ip': ips.join(','),
        'accessKey': accessKey,
        if (language != null) 'language': language.toString()
      },
    );

    final response = await client.get(uri);
    return (response.jsonBody as List)
        .map((json) => IpInformation.fromJson(json))
        .toList();
  }

  /// Fetch information about the device's current IP address.
  ///
  /// {@macro language_info}
  Future<IpInformation> lookupSelf({Language? language}) async {
    final uri = Uri(
      path: '/check',
      queryParameters: {
        'accessKey': accessKey,
        if (language != null) 'language': language.toString()
      },
    );

    final response = await client.get(uri);
    return IpInformation.fromJson(response.jsonBody);
  }
}
