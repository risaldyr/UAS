import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugasuaspm/Nomor2dan3/barang1.dart';
import 'package:tugasuaspm/Nomor2dan3/barang2.dart';
import 'package:tugasuaspm/Nomor2dan3/barang3.dart';
import 'package:tugasuaspm/Nomor2dan3/bloc.dart';
import 'package:tugasuaspm/Nomor2dan3/total.dart';
import 'package:tugasuaspm/Nomor2dan3/uang.dart';

class ProvBloc extends StatefulWidget {
  ProvBloc({Key key}) : super(key: key);

  @override
  _ProvBloc createState() => _ProvBloc();
}

class _ProvBloc extends State<ProvBloc> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Barang1>(
            create: (context) => Barang1(),
          ),
          ChangeNotifierProvider<Barang2>(
            create: (context) => Barang2(),
          ),
          ChangeNotifierProvider<Barang3>(
            create: (context) => Barang3(),
          ),
          ChangeNotifierProvider<Uang>(
            create: (context) => Uang(),
          ),
          ChangeNotifierProvider<Hasil>(
            create: (context) => Hasil(),
          ),
        ],
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Nomor 2 dan 3"),
            ),
            body: StreamBuilder(
                stream: bloc.stateStream,
                initialData: Colors.white,
                builder: (context, snapshot) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    color: snapshot.data,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Center(
                          child: Column(
                            children: <Widget>[
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                margin: EdgeInsets.only(
                                    left: 200, top: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  color: snapshot.data,
                                ),
                                width: double.infinity,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Uang",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500)),
                                    Consumer<Uang>(
                                      builder: (context, uang, _) => Text(
                                          uang.money.toString(),
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500)),
                                    )
                                  ],
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 5),
                                  color: snapshot.data,
                                ),
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                width: double.infinity,
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Barang 1 (10.000)",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                    Consumer<Barang1>(
                                      builder: (context, barang1, _) =>
                                          Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                barang1.quantity1.toString(),
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                            Consumer<Uang>(
                                              builder: (context, uang, _) =>
                                                  Consumer<Barang1>(
                                                builder:
                                                    (context, barang1, _) =>
                                                        Consumer<Hasil>(
                                                  builder: (context, hasil,
                                                          _) =>
                                                      IconButton(
                                                          icon: Icon(
                                                            Icons
                                                                .shopping_basket,
                                                            color: Colors.blue,
                                                          ),
                                                          onPressed: () {
                                                            if (uang.money >=
                                                                10000)
                                                              uang.money -=
                                                                  10000;
                                                            barang1.quantity1 +=
                                                                1;
                                                          }),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 5),
                                  color: snapshot.data,
                                ),
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                width: double.infinity,
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Barang 2 (25.000)",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                    Consumer<Barang2>(
                                      builder: (context, barang2, _) =>
                                          Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                barang2.quantity2.toString(),
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                            Consumer<Uang>(
                                              builder: (context, uang, _) =>
                                                  Consumer<Barang2>(
                                                builder: (context, barang2,
                                                        _) =>
                                                    IconButton(
                                                        icon: Icon(
                                                          Icons.shopping_basket,
                                                          color: Colors.blue,
                                                        ),
                                                        onPressed: () {
                                                          if (uang.money >=
                                                              25000)
                                                            uang.money -= 25000;
                                                          barang2.quantity2 +=
                                                              1;
                                                        }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 5),
                                  color: snapshot.data,
                                ),
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                width: double.infinity,
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Barang 3 (50.000)",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      child: Row(
                                        children: <Widget>[
                                          Consumer<Barang3>(
                                            builder: (context, barang3, _) =>
                                                Container(
                                              child: Text(
                                                barang3.quantity3.toString(),
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ),
                                          Consumer<Uang>(
                                            builder: (context, uang, _) =>
                                                Consumer<Barang3>(
                                              builder: (context, barang3, _) =>
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons.shopping_basket,
                                                        color: Colors.blue,
                                                      ),
                                                      onPressed: () {
                                                        if (uang.money >= 50000)
                                                          uang.money -= 50000;
                                                        barang3.quantity3 += 1;
                                                      }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              margin: EdgeInsets.only(
                                  bottom: 10, right: 10, left: 10),
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.blue, width: 5),
                                color: snapshot.data,
                              ),
                              child: Consumer<Barang3>(
                                builder: (context, barang3, _) =>
                                    Consumer<Barang2>(
                                  builder: (context, barang2, _) =>
                                      Consumer<Barang1>(
                                    builder: (context, barang1, _) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Total Harga",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        Text(
                                          ((10000 * barang1.quantity1) +
                                                  (25000 * barang2.quantity2) +
                                                  (50000 * barang3.quantity3))
                                              .toString(),
                                          style: TextStyle(color: Colors.blue),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue, width: 1)),
                                    child: FlatButton(
                                        onPressed: () {
                                          bloc.eventSink
                                              .add(ColorEvent.to_white);
                                        },
                                        child: Text("Mode Terang",
                                            style: TextStyle(
                                                color: Colors.blue)))),
                                AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue, width: 1)),
                                    child: FlatButton(
                                        onPressed: () {
                                          bloc.eventSink
                                              .add(ColorEvent.to_black);
                                        },
                                        child: Text(
                                          "Mode Gelap",
                                          style: TextStyle(color: Colors.blue),
                                        ))),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
