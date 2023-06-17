# api_tooling

This package is a helper package that contains utility classes & functions to help develop safe & complete API wrappers.

Users generally will not use this package directly, but rather an API wrapper implemented with this package's help.

## Using the package

Extend the `ApiClient` class and optionally override the `handleSuccess` and `handleErrors` to control how errors are handled.
```dart
class MyApiClient extends ApiClient {
    MyApiClient() : super(Uri.https('example.com', '/api'));

    @override
    HttpResponse handleError(ErrorHttpResponse response) {
        if (response.statusCode == 429) {
            return RateLimited(response, retryAfter: Duration(seconds: response.jsonBody['retry_after']));
        }

        return response;
    }
}
```

