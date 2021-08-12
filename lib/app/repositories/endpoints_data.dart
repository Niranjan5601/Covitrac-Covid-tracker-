import 'package:covitrac/app/services/api.dart';
import 'package:covitrac/app/services/endpoint_data.dart';
import 'package:flutter/foundation.dart';

class EndpointsData {
  final Map<Endpoint, EndpointData> values;

  EndpointsData({@required this.values});
  EndpointData get cases => values[Endpoint.cases];

  EndpointData get deaths => values[Endpoint.deaths];
  EndpointData get recovered => values[Endpoint.recovered];
}
