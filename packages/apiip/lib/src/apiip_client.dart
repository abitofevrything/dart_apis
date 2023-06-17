import 'package:api_tooling/client.dart';
import 'package:api_tooling/response.dart';

/// An [ApiClient] used to make requests to the [apiip.net](https://apiip.net)
/// API.
///
/// Use [Apiip] to use predefined methods to make calls to the API.
class ApiipClient extends ApiClient {
  /// Create a new [ApiipClient].
  ///
  /// Requests will be made over HTTP if [useHttps] is `true`.
  ApiipClient(bool useHttps)
      : super(useHttps
            ? Uri.https('apiip.net', '/api/')
            : Uri.http('apiip.net', '/api/'));

  @override
  ErrorApiResponse handleError(ErrorApiResponse response) {
    if (response.statusCode == 429) {
      return RateLimitedResponse(
        response,
        additionalInformation:
            'You exceeded the allowed number of requests per second, if you need more, please send us a message on www.apiip.net/contact',
      );
    }

    return ErrorApiResponse.withMessage(
      response,
      statusCode: response.jsonBody['message']['code'],
      reasonPhrase: response.jsonBody['message']['type'],
      additionalInformation: response.jsonBody['message']['info'],
    );
  }
}
