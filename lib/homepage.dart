import 'package:flutter/material.dart';
import 'package:tugasuaspm/Nomor1/getpage.dart';
import 'package:tugasuaspm/Nomor2dan3/providerdanbloc.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("TUGAS UAS Risaldy Raflisyamsudin "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
                child: Text("Nomor 1"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return GetAndDelete();
                    },
                  ));
                }),
            RaisedButton(
                child: Text("Nomor 2 dan 3"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ProvBloc();
                    },
                  ));
                }),
          ],
        ),
      ),
    ));
  }
}
