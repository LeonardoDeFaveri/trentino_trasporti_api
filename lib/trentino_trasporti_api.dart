library trentino_trasporti_api;

import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert' show utf8, base64, json;

import 'package:trentino_trasporti_api/model/model.dart';

const String baseUrl = 'app-tpl.tndigit.it';
const String authType = "Basic";
const String username = "mittmobile";
const String password = "ecGsp.RHB3";
const String xRequestWith = "it.tndigit.mit";

class TrentinoTrasportiApiClient {
  final http.Client client;
  final Uri baseUri;
  final Map<String, String> headers;
  final Duration timeout = const Duration(seconds: 30);

  TrentinoTrasportiApiClient()
      : client = http.Client(),
        baseUri = Uri.https(baseUrl, '/gtlservice'),
        headers = {
          'Authorization':
              '$authType ${base64.encode(utf8.encode('$username:$password'))}',
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'X-Requested-With': xRequestWith
        };

  Future<ApiResult<List<Route>>> getRoutes() async {
    var uri = Uri.https(baseUrl, '/gtlservice/routes');
    var response = await _sendRequest(uri);

    if (response.statusCode == 200) {
      List<Route> routes = List.empty(growable: true);
      var routesJson = json.decode(response.body) as List<dynamic>;
      for (Map<String, dynamic> route in routesJson) {
        routes.add(Route.fromJson(route));
      }
      return ApiOk(routes);
    }

    return ApiErr(response.statusCode, response.body);
  }

  Future<ApiResult<List<Stop>>> getStops() async {
    var uri = Uri.https(baseUrl, '/gtlservice/stops');
    var response = await _sendRequest(uri);

    if (response.statusCode == 200) {
      List<Stop> stops = List.empty(growable: true);
      var stopJson = json.decode(response.body) as List<dynamic>;
      for (Map<String, dynamic> stop in stopJson) {
        stops.add(Stop.fromJson(stop));
      }
      return ApiOk(stops);
    }

    return ApiErr(response.statusCode, response.body);
  }

  Future<ApiResult<List<Trip>>> getTripsForRoute(int routeId, AreaType area,
      Direction direction, int limit, DateTime dateTime) async {
    var queryHeaders = {
      'routeId': routeId.toString(),
      'type': area.id,
      'limit': limit.toString(),
      'refDateTime': dateTime.toIso8601String()
    };
    var directionId = direction.id;
    if (directionId != null) {
      queryHeaders.putIfAbsent('directionId', () => directionId.toString());
    }
    var uri = Uri.https(baseUrl, '/gtlservice/trips_new', queryHeaders);
    var response = await _sendRequest(uri);

    if (response.statusCode == 200) {
      List<Trip> trips = List.empty(growable: true);
      var tripsJson = json.decode(response.body) as List<dynamic>;
      for (Map<String, dynamic> trip in tripsJson) {
        trips.add(Trip.fromJson(trip));
      }
      return ApiOk(trips);
    }
    return ApiErr(response.statusCode, response.body);
  }

  Future<ApiResult<List<Trip>>> getTripsForStop(
      int stopId, AreaType area, int limit, DateTime dateTime) async {
    var uri = Uri.https(baseUrl, '/gtlservice/trips_new', {
      'stopId': stopId.toString(),
      'type': area.id,
      'limit': limit.toString(),
      'refDateTime': dateTime.toIso8601String()
    });
    var response = await _sendRequest(uri);

    if (response.statusCode == 200) {
      List<Trip> trips = List.empty(growable: true);
      var tripsJson = json.decode(response.body) as List<dynamic>;
      for (Map<String, dynamic> trip in tripsJson) {
        trips.add(Trip.fromJson(trip));
      }
      return ApiOk(trips);
    }
    return ApiErr(response.statusCode, response.body);
  }

  Future<ApiResult<Trip>> getTripDetails(String tripId) async {
    var uri = Uri.https(baseUrl, '/gtlservice/trips/$tripId');
    var response = await _sendRequest(uri);

    if (response.statusCode == 200) {
      var tripJson = json.decode(response.body) as Map<String, dynamic>;
      return ApiOk(Trip.fromJson(tripJson));
    }
    return ApiErr(response.statusCode, response.body);
  }

  /// Auxiliary methods that sends a get request to `uri`
  Future<http.Response> _sendRequest(Uri uri) {
    return http.get(uri, headers: headers).timeout(timeout).onError(
      (error, stackTrace) {
        if (error is TimeoutException) {
          return http.Response(stackTrace.toString(), 408);
        } else {
          return http.Response(stackTrace.toString(), 500);
        }
      },
    );
  }
}

sealed class ApiResult<T> {}

final class ApiOk<T> extends ApiResult<T> {
  final T result;

  ApiOk(this.result);
}

final class ApiErr<T> extends ApiResult<T> {
  final int errorCode;
  final String errorMessage;
  late final bool mayRetry;
  late final int _errorClass;
  late final String explanation;

  ApiErr(this.errorCode, this.errorMessage) {
    _errorClass = errorCode ~/ 100;
    switch (_errorClass) {
      case 1 || 3:
        mayRetry = true;
        explanation = 'Info: try sending the request again';
        break;
      case 4:
        mayRetry = false;
        explanation = 'App error: wrong request';
        break;
      case 5:
        mayRetry = false;
        explanation =
            'Service error: the service was unable to serve the request';
    }
  }
}
