// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IpInformation _$IpInformationFromJson(Map<String, dynamic> json) =>
    IpInformation(
      ip: json['ip'] as String,
      continentCode: json['continentCode'] as String?,
      continentName: json['continentName'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      countryNameNative: json['countryNameNative'] as String?,
      officialCountryName: json['officialCountryName'] as String?,
      regionCode: json['regionCode'] as String?,
      regionName: json['regionName'] as String?,
      cityGeoNameId: json['cityGeoNameId'] as int?,
      city: json['city'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      capital: json['capital'] as String?,
      phoneCode: json['phoneCode'] as String?,
      countryFlagEmoj: json['countryFlagEmoj'] as String?,
      countryFlagEmojUnicode: json['countryFlagEmojUnicode'] as String?,
      isEu: json['isEu'] as bool?,
      borders:
          (json['borders'] as List<dynamic>?)?.map((e) => e as String).toList(),
      topLevelDomains: (json['topLevelDomains'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      languages: (json['languages'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, LanguageInformation.fromJson(e as Map<String, dynamic>)),
      ),
      currency: json['currency'] == null
          ? null
          : CurrencyInformation.fromJson(
              json['currency'] as Map<String, dynamic>),
      timeZone: json['timeZone'] == null
          ? null
          : TimeZoneInformation.fromJson(
              json['timeZone'] as Map<String, dynamic>),
      userAgent: json['userAgent'] == null
          ? null
          : UserAgentInformation.fromJson(
              json['userAgent'] as Map<String, dynamic>),
      security: json['security'] == null
          ? null
          : SecurityInformation.fromJson(
              json['security'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IpInformationToJson(IpInformation instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'continentCode': instance.continentCode,
      'continentName': instance.continentName,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'countryNameNative': instance.countryNameNative,
      'officialCountryName': instance.officialCountryName,
      'regionCode': instance.regionCode,
      'regionName': instance.regionName,
      'cityGeoNameId': instance.cityGeoNameId,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'capital': instance.capital,
      'phoneCode': instance.phoneCode,
      'countryFlagEmoj': instance.countryFlagEmoj,
      'countryFlagEmojUnicode': instance.countryFlagEmojUnicode,
      'isEu': instance.isEu,
      'borders': instance.borders,
      'topLevelDomains': instance.topLevelDomains,
      'languages': instance.languages,
      'currency': instance.currency,
      'timeZone': instance.timeZone,
      'userAgent': instance.userAgent,
      'security': instance.security,
    };

LanguageInformation _$LanguageInformationFromJson(Map<String, dynamic> json) =>
    LanguageInformation(
      code: json['code'] as String,
      name: json['name'] as String,
      native: json['native'] as String,
    );

Map<String, dynamic> _$LanguageInformationToJson(
        LanguageInformation instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'native': instance.native,
    };

CurrencyInformation _$CurrencyInformationFromJson(Map<String, dynamic> json) =>
    CurrencyInformation(
      code: json['code'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      number: json['number'] as String,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$CurrencyInformationToJson(
        CurrencyInformation instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'symbol': instance.symbol,
      'number': instance.number,
      'rates': instance.rates,
    };

TimeZoneInformation _$TimeZoneInformationFromJson(Map<String, dynamic> json) =>
    TimeZoneInformation(
      id: json['id'] as String,
      currentTime: json['currentTime'] as String,
      code: json['code'] as String,
      timeZoneName: json['timeZoneName'] as String,
      utcOffset: json['utcOffset'] as int,
    );

Map<String, dynamic> _$TimeZoneInformationToJson(
        TimeZoneInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currentTime': instance.currentTime,
      'code': instance.code,
      'timeZoneName': instance.timeZoneName,
      'utcOffset': instance.utcOffset,
    };

UserAgentInformation _$UserAgentInformationFromJson(
        Map<String, dynamic> json) =>
    UserAgentInformation(
      isMobile: json['isMobile'] as bool,
      whichMobile: json['whichMobile'] as String?,
      isiPod: json['isiPod'] as bool,
      isTablet: json['isTablet'] as bool,
      isDesktop: json['isDesktop'] as bool,
      isSmartTV: json['isSmartTV'] as bool,
      isRaspberry: json['isRaspberry'] as bool,
      isBot: json['isBot'],
      browser: json['browser'] as String,
      browserVersion: json['browserVersion'] as String,
      operatingSystem: json['operatingSystem'] as String,
      platform: json['platform'] as String,
      source: json['source'] as String,
    );

Map<String, dynamic> _$UserAgentInformationToJson(
        UserAgentInformation instance) =>
    <String, dynamic>{
      'isMobile': instance.isMobile,
      'whichMobile': instance.whichMobile,
      'isiPod': instance.isiPod,
      'isTablet': instance.isTablet,
      'isDesktop': instance.isDesktop,
      'isSmartTV': instance.isSmartTV,
      'isRaspberry': instance.isRaspberry,
      'isBot': instance.isBot,
      'browser': instance.browser,
      'browserVersion': instance.browserVersion,
      'operatingSystem': instance.operatingSystem,
      'platform': instance.platform,
      'source': instance.source,
    };

SecurityInformation _$SecurityInformationFromJson(Map<String, dynamic> json) =>
    SecurityInformation(
      isProxy: json['isProxy'] as bool,
      isBogon: json['isBogon'] as bool,
      isTorExitNode: json['isTorExitNode'] as bool,
      isCloud: json['isCloud'] as bool,
      isHosting: json['isHosting'] as bool,
      isSpamhaus: json['isSpamhaus'] as bool,
      suggestion: json['suggestion'] as String,
      network: json['network'] as String,
    );

Map<String, dynamic> _$SecurityInformationToJson(
        SecurityInformation instance) =>
    <String, dynamic>{
      'isProxy': instance.isProxy,
      'isBogon': instance.isBogon,
      'isTorExitNode': instance.isTorExitNode,
      'isCloud': instance.isCloud,
      'isHosting': instance.isHosting,
      'isSpamhaus': instance.isSpamhaus,
      'suggestion': instance.suggestion,
      'network': instance.network,
    };
