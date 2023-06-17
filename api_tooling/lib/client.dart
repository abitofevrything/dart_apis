import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:api_tooling/response.dart';
import 'package:http/http.dart';

/// A [HttpClient] with functionality common when writing API wrappers.
abstract class ApiClient implements Client {
  /// The inner [Client] that will be used to make requests.
  final Client inner = Client();

  /// The base location of the API.
  ///
  /// Requests without an explicit host will be resolved relative to this URL.
  final Uri apiLocation;

  /// Create a new [ApiClient] sending requests to [apiLocation].
  ApiClient(this.apiLocation);

  /// Send [request] and return the response if it is a [SuccessApiResponse], or
  /// throw if it is an [ErrorApiResponse].
  @override
  Future<SuccessApiResponse> send(BaseRequest request) async {
    final response = await sendUnsafe(request);

    if (response is RateLimitedResponse) {
      return Future.delayed(
        response.retryAfter ?? const Duration(seconds: 10),
        () => send(request),
      );
    }

    if (response is! SuccessApiResponse) {
      throw response;
    }

    return response;
  }

  /// Send [request] and return the response.
  Future<ApiResponse> sendUnsafe(BaseRequest request) async {
    final response = await inner.send(_ApiRequest(this, request));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return handleSuccess(
        await SuccessApiResponse.fromResponse(request, response),
      );
    }

    return handleError(await ErrorApiResponse.fromResponse(request, response));
  }

  /// Called to transform a plain [ErrorApiResponse] into one with information
  /// specific to the API.
  FutureOr<ApiResponse> handleError(ErrorApiResponse response) => response;

  /// Called to transform a plain [SuccessApiResponse] into one with information
  /// specific to the API.
  FutureOr<ApiResponse> handleSuccess(SuccessApiResponse response) => response;

  Future<SuccessApiResponse> _simpleSend(
    String method,
    Uri url,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  ) async {
    var request = Request(method, url);

    if (headers != null) request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }

    return await send(request);
  }

  @override
  Future<SuccessApiResponse> delete(Uri url,
          {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _simpleSend('DELETE', url, headers, body, encoding);

  @override
  Future<SuccessApiResponse> get(Uri url, {Map<String, String>? headers}) =>
      _simpleSend('GET', url, headers, null, null);

  @override
  Future<SuccessApiResponse> head(Uri url, {Map<String, String>? headers}) =>
      _simpleSend('HEAD', url, headers, null, null);

  @override
  Future<SuccessApiResponse> patch(Uri url,
          {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _simpleSend('PATCH', url, headers, body, encoding);

  @override
  Future<SuccessApiResponse> post(Uri url,
          {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _simpleSend('POST', url, headers, body, encoding);

  @override
  Future<SuccessApiResponse> put(Uri url,
          {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _simpleSend('PUT', url, headers, body, encoding);

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) =>
      get(url, headers: headers).then((value) => value.body);

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) =>
      get(url, headers: headers).then((value) => value.bodyBytes);

  @override
  void close() => inner.close();
}

class _ApiRequest implements BaseRequest {
  final BaseRequest inner;

  final ApiClient client;

  _ApiRequest(this.client, this.inner);

  @override
  Uri get url {
    Uri relative = inner.url;

    if (relative.path.startsWith('/') && !relative.isAbsolute) {
      // This removes the leading slash
      relative = relative.replace(pathSegments: relative.pathSegments);
    }

    return client.apiLocation.resolveUri(relative);
  }

  @override
  int? get contentLength => inner.contentLength;

  @override
  set contentLength(int? value) => inner.contentLength = value;

  @override
  bool get followRedirects => inner.followRedirects;

  @override
  set followRedirects(bool value) => inner.followRedirects = value;

  @override
  int get maxRedirects => inner.maxRedirects;

  @override
  set maxRedirects(int value) => inner.maxRedirects = value;

  @override
  bool get persistentConnection => inner.persistentConnection;

  @override
  set persistentConnection(bool value) => inner.persistentConnection = value;

  @override
  ByteStream finalize() => inner.finalize();

  @override
  bool get finalized => inner.finalized;

  @override
  Map<String, String> get headers => inner.headers;

  @override
  String get method => inner.method;

  @override
  Future<StreamedResponse> send() => inner.send();
}
