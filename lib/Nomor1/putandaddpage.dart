import 'package:flutter/material.dart';
import 'package:tugasuaspm/Nomor1/get.dart';
import 'package:tugasuaspm/Nomor1/getpage.dart';

import 'Apiservice.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

// ignore: must_be_immutable
class PutAndAdd extends StatefulWidget {
  Get1 get1;

  PutAndAdd({this.get1});
  @override
  _PutAndAddState createState() => _PutAndAddState();
}

class _PutAndAddState extends State<PutAndAdd> {
  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isFieldNameValid;
  bool _isFieldJobValid;
  bool _isFieldAgeValid;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerJob = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();
  @override
  void initState() {
    if (widget.get1 != null) {
      _isFieldNameValid = true;
      _controllerName.text = widget.get1.name;
      _isFieldJobValid = true;
      _controllerJob.text = widget.get1.job;
      _isFieldAgeValid = true;
      _controllerAge.text = widget.get1.age.toString();
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return GetAndDelete();
              }));
            }),
        title: Text(
          widget.get1 == null ? "Form Add" : "Change Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldName(),
                _buildTextFieldjob(),
                _buildTextFieldAge(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_isFieldNameValid == null ||
                          _isFieldJobValid == null ||
                          _isFieldAgeValid == null ||
                          !_isFieldNameValid ||
                          !_isFieldJobValid ||
                          !_isFieldAgeValid) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("ISI FORM TERSEBUT"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      String name = _controllerName.text.toString();
                      String job = _controllerJob.text.toString();
                      int age = int.parse(_controllerAge.text.toString());
                      Get1 profile = Get1(name: name, job: job, age: age);
                      if (widget.get1 == null) {
                        _apiService.createGet1(profile).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submit Berhasil"),
                            ));
                          }
                        });
                      } else {
                        profile.id = widget.get1.id;
                        _apiService.updateGet1(profile).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Update data failed"),
                            ));
                          }
                        });
                      }
                    },
                    child: Text(
                      "Selesai".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldName() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Nama Panjang",
        errorText: _isFieldNameValid == null || _isFieldNameValid
            ? null
            : "Nama Panjang belum terisi",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldjob() {
    return TextField(
      controller: _controllerJob,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Pekerjaan",
        errorText: _isFieldJobValid == null || _isFieldJobValid
            ? null
            : "Pekerjaan belum terisi",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldJobValid) {
          setState(() => _isFieldJobValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldAge() {
    return TextField(
      controller: _controllerAge,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Umur",
        errorText: _isFieldAgeValid == null || _isFieldAgeValid
            ? null
            : "Umur belum terisi",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAgeValid) {
          setState(() => _isFieldAgeValid = isFieldValid);
        }
      },
    );
  }
}
