import 'package:json_annotation/json_annotation.dart';

part 'ip_information.g.dart';

/// {@template ip_information}
/// Information about an IP address.
/// {@endtemplate}
@JsonSerializable()
class IpInformation {
  /// The requested IP address.
  final String ip;

  /// The 2-letter continent code associated with the IP address.
  final String? continentCode;

  /// The continent name associated with the IP address.
  final String? continentName;

  /// The 2-letter country code associated with the IP address.
  final String? countryCode;

  /// The country name associated with the IP address.
  final String? countryName;

  /// The native country name associated with the IP address.
  final String? countryNameNative;

  /// The official country name associated with the IP address.
  final String? officialCountryName;

  /// The region code associated with the IP address.
  final String? regionCode;

  /// The region name associated with the IP address.
  final String? regionName;

  /// The city geo name ID associated with the IP address.
  final int? cityGeoNameId;

  /// The city name associated with the IP address.
  final String? city;

  /// The approximate latitude of the location associated with the IP address.
  final double? latitude;

  /// The approximate longitude of the location associated with the IP address.
  final double? longitude;

  /// Returns the capital city of the country associated with the IP address.
  final String? capital;

  /// The calling/dial code associated with the IP address. (e.g. 381 for
  /// Serbia)
  final String? phoneCode;

  /// The emoji icon for the country flag associated with the IP address.
  final String? countryFlagEmoj;

  /// The unicode value of the emoji icon for the country flag associated with
  /// the IP address. (e.g. 'U+1F1F7 U+1F1F8' for the Serbian flag)
  final String? countryFlagEmojUnicode;

  /// Whether the given country is part of the EU.
  final bool? isEu;

  /// The Alpha‑3 code for every country that borders the given country.
  final List<String>? borders;

  /// The top level domains for the given country.
  final List<String>? topLevelDomains;

  /// Languages associated with this IP address.
  final Map<String, LanguageInformation>? languages;

  /// Data related to currency.
  final CurrencyInformation? currency;

  /// Data related to timezone.
  final TimeZoneInformation? timeZone;

  /// Data related to the user agent.
  final UserAgentInformation? userAgent;

  /// Data relatetd to security.
  final SecurityInformation? security;

  /// {@macro ip_information}
  IpInformation({
    required this.ip,
    required this.continentCode,
    required this.continentName,
    required this.countryCode,
    required this.countryName,
    required this.countryNameNative,
    required this.officialCountryName,
    required this.regionCode,
    required this.regionName,
    required this.cityGeoNameId,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.capital,
    required this.phoneCode,
    required this.countryFlagEmoj,
    required this.countryFlagEmojUnicode,
    required this.isEu,
    required this.borders,
    required this.topLevelDomains,
    required this.languages,
    required this.currency,
    required this.timeZone,
    required this.userAgent,
    required this.security,
  });

  /// Parse a [IpInformation] from a JSON value.
  factory IpInformation.fromJson(Map<String, Object?> json) =>
      _$IpInformationFromJson(json);
}

/// {@template language}
/// Information about a language.
/// {@endtemplate}
@JsonSerializable()
class LanguageInformation {
  /// The 2-letter language code for this language.
  final String code;

  /// This language's name.
  final String name;

  /// This language's native name.
  final String native;

  /// {@macro language}
  LanguageInformation({
    required this.code,
    required this.name,
    required this.native,
  });

  /// Parse a [LanguageInformation] from a JSON value.
  factory LanguageInformation.fromJson(Map<String, Object?> json) =>
      _$LanguageInformationFromJson(json);
}

/// {@template currency}
/// Information about a currency.
/// {@endtemplate}
@JsonSerializable()
class CurrencyInformation {
  /// The 3-letter code of the main currency associated with an IP address.
  /// (e.g. USD for United States dollar)
  final String code;

  /// The name of this currency.
  final String name;

  /// The native symbol of this currency.
  final String symbol;

  /// The number of this currency.
  final String number;

  /// An object containing rates from the USD and EUR to this currency.
  final Map<String, double> rates;

  /// {@macro currency}
  CurrencyInformation({
    required this.code,
    required this.name,
    required this.symbol,
    required this.number,
    required this.rates,
  });

  /// Parse a [CurrencyInformation] from a JSON value.
  factory CurrencyInformation.fromJson(Map<String, Object?> json) =>
      _$CurrencyInformationFromJson(json);
}

/// {@template time_zone}
/// Information about a timezone.
/// {@endtemplate}
@JsonSerializable()
class TimeZoneInformation {
  /// The time zone ID associated with an IP address. (e.g. America/New_York)
  final String id;

  /// The current date and time associated with an IP address.
  final String currentTime;

  /// The universal code of this time zone.
  final String code;

  /// The time zone name associated with an IP address.
  final String timeZoneName;

  /// The UTC offset which is the difference between Coordinated Universal Time
  /// (UTC) and local time.
  final int utcOffset;

  /// {@macro time_zone}
  TimeZoneInformation({
    required this.id,
    required this.currentTime,
    required this.code,
    required this.timeZoneName,
    required this.utcOffset,
  });

  /// Parse a [TimeZoneInformation] from a JSON value.
  factory TimeZoneInformation.fromJson(Map<String, Object?> json) =>
      _$TimeZoneInformationFromJson(json);
}

/// {@template user_agent}
/// Information about a user-agent.
/// {@endtemplate}
@JsonSerializable()
class UserAgentInformation {
  /// Whether the user uses a mobile device.
  final bool isMobile;

  /// A string containing data of the user's mobile device.
  /// (e.g. iPhone, android or blackberry)
  final String? whichMobile;

  /// Whether the user uses a iPod.
  final bool isiPod;

  /// Whether the user uses a tablet.
  final bool isTablet;

  /// Whether the user uses a desktop.
  final bool isDesktop;

  /// Whether the user uses a smart TV.
  final bool isSmartTV;

  /// Whether the user uses a raspberry.
  final bool isRaspberry;

  /// Returns a boolean/string containing if the user uses a bot.
  final dynamic /* bool | String */ isBot;

  /// A string containing data of the user's browser.
  final String browser;

  /// A string containing data of the user's browser version.
  final String browserVersion;

  /// A string containing data of the user's operating system.
  final String operatingSystem;

  /// A string containing data of the user's platform.
  final String platform;

  /// A string containing data of the user's agent header sent to the server.
  final String source;

  /// {@macro user_agent}
  UserAgentInformation({
    required this.isMobile,
    required this.whichMobile,
    required this.isiPod,
    required this.isTablet,
    required this.isDesktop,
    required this.isSmartTV,
    required this.isRaspberry,
    required this.isBot,
    required this.browser,
    required this.browserVersion,
    required this.operatingSystem,
    required this.platform,
    required this.source,
  });

  /// Parse a [UserAgentInformation] from a JSON value.
  factory UserAgentInformation.fromJson(Map<String, Object?> json) =>
      _$UserAgentInformationFromJson(json);
}

/// {@template security}
/// Security information.
/// {@endtemplate}
@JsonSerializable()
class SecurityInformation {
  /// Whether the IP address used by proxy providers, open proxies, and
  /// exploited devices on the internet that are now acting as a proxy.
  final bool isProxy;

  /// Whether the IP address is not internet routable.
  final bool isBogon;

  /// Whether the given IP address is associated with the Tor system, false if
  /// not.
  final bool isTorExitNode;

  /// Whether the given IP address is associated with Google and AWS cloud
  /// services.
  ///
  /// For most user-facing applications, you should never see requests coming
  /// from this IP address. They are thus most likely bots, scrapers, or a user
  /// utilizing a cloud service as a proxy.
  final bool isCloud;

  /// Whether the given IP address is associated with networks that are
  /// predominately used for hosting servers.
  ///
  /// One such example is Digital Ocean.
  ///
  /// In most cases, a user-facing application shouldn’t see requests coming
  /// from a hosting network. If they are, it is likely being used as a proxy by
  /// an end-user, being used for scraping, or nefarious traffic.
  final bool isHosting;

  /// Whether the given IP address is associated with network providers that
  /// have malicious intent and have created a constant and continuous threat
  /// for a lengthy period.
  ///
  /// We highly suggest blocking any traffic marked like this. For both user,
  /// and non-user-facing applications.
  final bool isSpamhaus;

  /// Returns string with possible values (block and allow), suggesting if the
  /// IP address should be blocked or not.
  final String suggestion;

  /// Returns the network where the given IP address belongs.
  final String network;

  /// {@macro security}
  SecurityInformation({
    required this.isProxy,
    required this.isBogon,
    required this.isTorExitNode,
    required this.isCloud,
    required this.isHosting,
    required this.isSpamhaus,
    required this.suggestion,
    required this.network,
  });

  /// Parse a [SecurityInformation] from a JSON value.
  factory SecurityInformation.fromJson(Map<String, Object?> json) =>
      _$SecurityInformationFromJson(json);
}
