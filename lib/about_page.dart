import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Openpad',textScaleFactor: 2,style: TextStyle(letterSpacing: 3),),
              Text('Free and open souce text editiong tool',style: TextStyle(fontWeight: FontWeight.w300),),
              Text('<3 with flutter',style: TextStyle(fontWeight: FontWeight.w100),),
            ],
          ),
        
        ),
      ),
    );
  }
}