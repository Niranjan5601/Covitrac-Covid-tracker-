import 'package:covitrac/ui/cardbox.dart';
import 'package:flutter/material.dart';

class PrecautionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title:
              Text('Precautions', style: TextStyle(color: Colors.green[700])),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 50.0,
          mainAxisSpacing: 90.0,
          padding: EdgeInsets.all(30),
          children: [
            CardBox(text: 'Stay Home', assertPath: 'assets/stay-at-home.png'),
            CardBox(text: 'Wash Hands', assertPath: 'assets/washing-hands.png'),
            CardBox(text: 'Wear Mask', assertPath: 'assets/woman.png'),
            CardBox(
                text: ' Social Distancing',
                assertPath: 'assets/social-distancing.png')
          ],
        ));
  }
}
