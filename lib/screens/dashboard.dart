import 'dart:io';

import 'package:covitrac/app/repositories/data_repository.dart';
import 'package:covitrac/app/repositories/endpoints_data.dart';
import 'package:covitrac/app/services/api.dart';
import 'package:covitrac/ui/bottom_navigation.dart';

import 'package:covitrac/ui/show_alert_dialog.dart';

import '../ui/endpoint_card.dart';
import 'package:covitrac/ui/last_updated_status_test.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData _endpointsData;

  @override
  void initState() {
    super.initState();
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    _endpointsData = dataRepository.getAllEndpointsCachedData();
    _updateData();
  }

  Future<void> _updateData() async {
    try {
      final dataRepository =
          Provider.of<DataRepository>(context, listen: false);
      final endpointsData = await dataRepository.getAllEndpointsData();
      setState(() => _endpointsData = endpointsData);
    } on SocketException catch (_) {
      showAlertDialog(
          context: context,
          title: 'Connection Error',
          content: 'Could not retrive data .Please try again later',
          defaultActionText: 'Ok');
    } catch (_) {
      showAlertDialog(
          context: context,
          title: 'Unknown Error',
          content: 'Please try again later',
          defaultActionText: 'Ok');
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = LastUpdatedateFormatter(
      lastUpdated: _endpointsData != null
          ? _endpointsData.values[Endpoint.cases]?.date
          : null,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Coronavirus Tracker',
          style: TextStyle(color: Colors.green[700]),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        color: Colors.green[500],
        onRefresh: _updateData,
        child: ListView(
          children: <Widget>[
            LastUpdatedStatusText(
              text: formatter.lastUpdatedStatusText(),
            ),
            for (var endpoint in Endpoint.values)
              EndPointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData.values[endpoint]?.value
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
