import 'package:covitrac/ui/cardbox.dart';
import 'package:flutter/material.dart';

class SymptomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Symptoms', style: TextStyle(color: Colors.green[700])),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 50.0,
          mainAxisSpacing: 90.0,
          padding: EdgeInsets.all(30),
          children: [
            CardBox(text: 'Fever', assertPath: 'assets/fever.png'),
            CardBox(text: 'Tiredness', assertPath: 'assets/dizziness.png'),
            CardBox(text: 'Dry Cough', assertPath: 'assets/cough.png'),
            CardBox(text: 'Headache', assertPath: 'assets/pain.png')
          ],
        ));
  }
}
