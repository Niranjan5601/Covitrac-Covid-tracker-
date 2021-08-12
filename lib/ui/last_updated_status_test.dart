import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdatedateFormatter {
  final DateTime lastUpdated;

  LastUpdatedateFormatter({@required this.lastUpdated});
  String lastUpdatedStatusText() {
    if (lastUpdated != null) {
      final formatter = DateFormat.yMEd().add_Hms();
      final formatted = formatter.format(lastUpdated);
      return 'Last updated : $formatted';
    }
    return '';
  }
}

class LastUpdatedStatusText extends StatelessWidget {
  const LastUpdatedStatusText({Key key, @required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.green[500]),
      ),
    );
  }
}
