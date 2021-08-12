import 'package:covitrac/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EndpointCardData {
  final String title;
  final String assetName;
  final Color color;

  EndpointCardData(this.title, this.assetName, this.color);
}

class EndPointCard extends StatelessWidget {
  final Endpoint endpoint;
  final int value;
  static Map<Endpoint, EndpointCardData> _cardsData = {
    Endpoint.cases:
        EndpointCardData('Cases', 'assets/patient.png', Color(0xFFFDD835)),
    Endpoint.deaths:
        EndpointCardData('Deaths', 'assets/spirit.png', Color(0xFFE40000)),
    Endpoint.recovered: EndpointCardData(
        'Recovered', 'assets/rehabilitation.png', Color(0xFF70A901)),
  };
  const EndPointCard({this.endpoint, this.value});
  String get formattedValue {
    if (value == null) {
      return '';
    }
    return NumberFormat('#,##,##,##,###').format(value);
  }

  @override
  Widget build(BuildContext context) {
    final cardData = _cardsData[endpoint];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Card(
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cardData.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(color: cardData?.color)),
                SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 52,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        cardData.assetName,
                        color: cardData.color,
                      ),
                      Text(
                        formattedValue,
                        style: Theme.of(context).textTheme.display1.copyWith(
                            color: cardData.color, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
