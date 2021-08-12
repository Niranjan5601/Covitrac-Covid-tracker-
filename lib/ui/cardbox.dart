import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {
  final String text;
  final String assertPath;

  CardBox({@required this.text, @required this.assertPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(assertPath),
                height: 100,
                fit: BoxFit.cover,
              )
            ],
          ),
          Text(text,
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
