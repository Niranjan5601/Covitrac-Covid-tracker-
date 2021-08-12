import 'package:covitrac/app/repositories/endpoints_data.dart';
import 'package:covitrac/app/services/api.dart';
import 'package:covitrac/app/services/endpoint_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataCacheService {
  DataCacheService({@required this.sharedPreferences});
  final SharedPreferences sharedPreferences;
  static String endpointValueKey(Endpoint endpoint) => '$endpoint/value';
  static String endpointdateKey(Endpoint endpoint) => '$endpoint/date';

  EndpointsData getData() {
    Map<Endpoint, EndpointData> values = {};
    Endpoint.values.forEach((endpoint) {
      final value = sharedPreferences.getInt(endpointValueKey(endpoint));
      final dateString = sharedPreferences.getString(endpointdateKey(endpoint));
      if (value != null && dateString != null) {
        final date = DateTime.tryParse(dateString);
        values[endpoint] = EndpointData(value: value, date: date);
      }
    });
    return EndpointsData(values: values);
  }

  Future<void> setData(EndpointsData endpointsdata) async {
    endpointsdata.values.forEach((endpoint, endpointData) async {
      await sharedPreferences.setInt(
          endpointValueKey(endpoint), endpointData?.value);
      await sharedPreferences.setString(
        endpointdateKey(endpoint),
        endpointData.date.toIso8601String(),
      );
    });
  }
}
