import 'package:tugasuaspm/Nomor1/putandaddpage.dart';

import 'Apiservice.dart';
import 'package:flutter/material.dart';

import 'get.dart';

class GetAndDelete extends StatefulWidget {
  @override
  _GetAndDeleteState createState() => _GetAndDeleteState();
}

class _GetAndDeleteState extends State<GetAndDelete> {
  BuildContext context;
  ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SafeArea(
      child: FutureBuilder(
        future: apiService.getGets1(),
        builder: (BuildContext context, AsyncSnapshot<List<Get1>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Get1> profiles = snapshot.data;
            return _buildListView(profiles);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Get1> profiles) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.black,),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PutAndAdd();
          }));
        },
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Nomor 1"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            Get1 profile = profiles[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                elevation: 2,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        profile.name,
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(profile.job),
                      Text(profile.age.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Perhatian!"),
                                      content: Text(
                                          "Kamu Yakin Mau Menghapus ${profile.name}?"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Iya"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            apiService
                                                .deleteGet1(profile.id)
                                                .then((isSuccess) {
                                              if (isSuccess) {
                                                setState(() {});
                                                Scaffold.of(this.context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Menghapus berhasil")));
                                              } else {
                                                Scaffold.of(this.context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Gagal Menghapus")));
                                              }
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("Tidak"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PutAndAdd(
                                  get1: profile,
                                );
                              }));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: profiles.length,
        ),
      ),
    );
  }
}
