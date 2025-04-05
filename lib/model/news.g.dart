// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      agencyId: json['agencyId'] as String,
      details: json['details'] as String,
      header: json['header'] as String,
      routeIds: (News.readRouteIds(json, 'RouteIds') as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      serviceType: json['serviceType'] as String,
      startDate: News.readDate(json['startDate'] as String),
      endDate: News.readDate(json['endDate'] as String),
      url: Uri.parse(json['url'] as String),
      stopId: News.readStopId(json['stopId'] as Object),
      idFeed: (json['idFeed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'agencyId': instance.agencyId,
      'details': instance.details,
      'header': instance.header,
      'idFeed': instance.idFeed,
      'RouteIds': News.writeRouteIds(instance.routeIds),
      'serviceType': instance.serviceType,
      'startDate': News.writeDate(instance.startDate),
      'endDate': News.writeDate(instance.endDate),
      'stopId': instance.stopId,
      'url': instance.url.toString(),
    };
