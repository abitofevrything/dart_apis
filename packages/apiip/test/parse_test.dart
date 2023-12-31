import 'package:apiip/apiip.dart';
import 'package:test/test.dart';

void main() {
  test('Can parse sample response', () {
    final json = {
      "ip": "67.250.186.196",
      "continentCode": "NA",
      "continentName": "North America",
      "countryCode": "US",
      "countryName": "United States",
      "countryNameNative": "United States",
      "officialCountryName": "United States of America",
      "regionCode": "NY",
      "regionName": "New York",
      "city": "New York",
      "postalCode": "10001",
      "latitude": 40.8271,
      "longitude": -73.9359,
      "capital": "Washington D.C.",
      "phoneCode": "1",
      "countryFlagEmoj": "🇺🇸",
      "countryFlagEmojUnicode": "U+1F1FA U+1F1F8",
      "isEu": false,
      "borders": ["CAN", "MEX"],
      "topLevelDomains": [".us"],
      "languages": {
        "en": {"code": "en", "name": "English", "native": "English"}
      },
      "currency": {
        "code": "USD",
        "name": "US Dollar",
        "symbol": r"$",
        "number": "840",
        "rates": {"EURUSD": 1.11}
      },
      "timeZone": {
        "id": "America/New_York",
        "currentTime": "10/26/2021, 2:54:10 PM",
        "code": "EDT",
        "timeZoneName": "EDT",
        "utcOffset": -14400
      },
      "userAgent": {
        "isMobile": false,
        "isiPod": false,
        "isTablet": false,
        "isDesktop": true,
        "isSmartTV": false,
        "isRaspberry": false,
        "isBot": false,
        "browser": "Chrome",
        "browserVersion": "100.0.4896.127",
        "operatingSystem": "Windows 10.0",
        "platform": "Microsoft Windows",
        "source":
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36"
      },
      "connection": {"asn": 12271, "isp": "Charter Communications Inc"},
      "security": {
        "isProxy": false,
        "isBogon": false,
        "isTorExitNode": false,
        "isCloud": false,
        "isHosting": false,
        "isSpamhaus": false,
        "suggestion": "allow",
        "network": "67.250.176.0/20"
      }
    };

    expect(() => IpInformation.fromJson(json), returnsNormally);
  });
}
