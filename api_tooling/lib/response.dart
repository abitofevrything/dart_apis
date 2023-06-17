import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';

/// A [Response] from an [ApiClient].
///
/// Helps deserializing requests and provides [toString] support.
abstract class ApiResponse implements StreamedResponse, Response {
  /// The response from the inner http client.
  final StreamedResponse inner;

  @override
  final BaseRequest request;

  @override
  final int statusCode;

  @override
  final Map<String, String> headers;

  @override
  final Uint8List bodyBytes;

  @override
  late final String body = _loadTextBody();

  /// The body of the request deserialized as JSON.
  ///
  /// Will be `null` if the body cannot be parsed as JSON.
  dynamic get jsonBody => _jsonBody.$2;

  /// Whether the body of the request was parseable as JSON.
  ///
  /// Allows to disambiguate between a JSON `null` and a parsing failure in
  /// [jsonBody].
  bool get hasJsonBody => _jsonBody.$1;

  late final (bool, dynamic) _jsonBody = _loadJsonBody();

  /// Create a new [ApiResponse].
  ApiResponse({
    required this.inner,
    required this.bodyBytes,
    required this.request,
  })  : statusCode = inner.statusCode,
        headers = inner.headers;

  String _loadTextBody() {
    return utf8.decode(bodyBytes);
  }

  (bool, dynamic) _loadJsonBody() {
    try {
      return (true, jsonDecode(body));
    } on FormatException {
      return (false, null);
    }
  }

  @override
  int? get contentLength => inner.contentLength;

  @override
  bool get isRedirect => inner.isRedirect;

  @override
  bool get persistentConnection => inner.persistentConnection;

  @override
  String? get reasonPhrase => inner.reasonPhrase;

  @override
  ByteStream get stream => ByteStream.fromBytes(bodyBytes);

  @override
  String toString() => '$statusCode ${request.method} ${request.url}';
}

/// A successful [ApiResponse], most likely with a status code between 200 and
/// 299.
class SuccessApiResponse extends ApiResponse {
  /// Create a new [SuccessApiResponse].
  SuccessApiResponse({
    required super.inner,
    required super.bodyBytes,
    required super.request,
  });

  /// Create a [SuccessApiResponse] from a [StreamedResponse].
  static Future<SuccessApiResponse> fromResponse(
    BaseRequest request,
    StreamedResponse response,
  ) async =>
      SuccessApiResponse(
        inner: response,
        bodyBytes: await response.stream.toBytes(),
        request: request,
      );
}

/// An [ApiResponse] that represents an error.
class ErrorApiResponse extends ApiResponse implements Exception {
  /// Additional information associated with the error.
  final String? additionalInformation;

  /// Create a new [ErrorApiResponse].
  ErrorApiResponse({
    required super.inner,
    required super.bodyBytes,
    required super.request,
    this.additionalInformation,
  });

  /// Create an [ErrorApiResponse] with a message displayed in [toString].
  factory ErrorApiResponse.withMessage(
    ErrorApiResponse inner, {
    String? additionalInformation,
    int? statusCode,
    String? reasonPhrase,
  }) = _MessageResponse;

  /// Create an [ErrorApiResponse] from a [StreamedResponse].
  static Future<ErrorApiResponse> fromResponse(
    BaseRequest request,
    StreamedResponse response,
  ) async =>
      ErrorApiResponse(
        inner: response,
        bodyBytes: await response.stream.toBytes(),
        request: request,
      );
}

class _MessageResponse implements ErrorApiResponse {
  @override
  final ErrorApiResponse inner;

  @override
  final String? additionalInformation;

  @override
  final int statusCode;

  @override
  final String? reasonPhrase;

  _MessageResponse(
    this.inner, {
    this.additionalInformation,
    int? statusCode,
    String? reasonPhrase,
  })  : statusCode = statusCode ?? inner.statusCode,
        reasonPhrase = reasonPhrase ?? inner.reasonPhrase;

  @override
  String toString() =>
      '$reasonPhrase ($statusCode) ${request.method} ${request.url}';

  // Methods that forward to the underlying response

  @override
  (bool, dynamic) get _jsonBody => inner.jsonBody;

  @override
  (bool, dynamic) _loadJsonBody() => inner._loadJsonBody();

  @override
  String _loadTextBody() => inner._loadTextBody();

  @override
  String get body => inner.body;

  @override
  Uint8List get bodyBytes => inner.bodyBytes;

  @override
  int? get contentLength => inner.contentLength;

  @override
  bool get hasJsonBody => inner.hasJsonBody;

  @override
  Map<String, String> get headers => inner.headers;

  @override
  bool get isRedirect => inner.isRedirect;

  @override
  get jsonBody => inner.jsonBody;

  @override
  bool get persistentConnection => inner.persistentConnection;

  @override
  BaseRequest get request => inner.request;

  @override
  ByteStream get stream => inner.stream;
}

/// An [ApiResponse] that represents a rate limited response.
///
/// [ApiClient]s will automatically retry these requests.
class RateLimitedResponse extends _MessageResponse {
  /// The time after which the request should be retried.
  final Duration? retryAfter;

  /// Create a new [RateLimitedResponse].
  RateLimitedResponse(
    super.inner, {
    this.retryAfter,
    super.additionalInformation,
  });
}
