import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ProfileScreen extends StatefulWidget{

  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen>{
  final _formKey = GlobalKey<FormState>();
  int dropdownValue = 1;
  double _value = 0;
  String _status = 'idle';
  Color _statusColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //appBar: AppBar(title: Text("")),
      body: Container(
        margin: const EdgeInsets.only(top: 80.0, left: 10.0, right: 10.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 45,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                        )
                      ]),
                  child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.account_box, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'LogOut',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'PoppinsMedium'),
                            )
                          ],
                        ),
                      )),
                ),
                Container(
                  height: 45,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                        )
                      ]),
                  child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4)
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        clipBehavior: Clip.none,
                                        children: [
                                          SizedBox(
                                            height: 360.0,
                                            child: Padding(
                                                padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
                                                child: Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "PREFERENCIAS DEL USUARIO",
                                                        style: TextStyle(
                                                          fontSize: 20.0,
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width / 1.5,
                                                        child: TextFormField(
                                                          decoration: const InputDecoration(
                                                            icon: Icon(Icons.person),
                                                            labelText: 'Nombre',
                                                          ),
                                                          onSaved: (String? value) {
                                                            // This optional block of code can be used to run
                                                            // code when the user saves the form.
                                                          },
                                                          validator: (String? value) {
                                                            return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                                          },
                                                        )
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.only(bottom: 20),
                                                        width: 100,
                                                        child: DropdownButtonFormField<int>(
                                                          decoration: InputDecoration(
                                                            contentPadding: const EdgeInsets.only(bottom: 5.0,top: 15.0),
                                                            label: Text(
                                                                "Cucharadas de azucar",
                                                                textAlign: TextAlign.center,
                                                                style:const TextStyle(
                                                                    fontSize:18.0,

                                                                )
                                                            ),
                                                          ),
                                                          value: dropdownValue,
                                                          onChanged: (int? newValue) {
                                                            setState(() {
                                                              dropdownValue = newValue!;
                                                            });
                                                          },
                                                          items: <int>[1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
                                                            return DropdownMenuItem<int>(
                                                              value: value,
                                                              child: Text(
                                                                value.toString(),
                                                              ),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                      Slider(
                                                        min: 0.0,
                                                        max: 40.0,
                                                        value: _value,
                                                        divisions: 4,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _value = value;
                                                            _status = 'active (${_value.round()})';
                                                            _statusColor = Colors.green;
                                                          });
                                                        },
                                                        onChangeStart: (value) {
                                                          setState(() {
                                                            _status = 'start';
                                                            _statusColor = Colors.lightGreen;
                                                          });
                                                        },
                                                        onChangeEnd: (value) {
                                                          setState(() {
                                                            _status = 'end';
                                                            _statusColor = Colors.red;
                                                          });
                                                        },
                                                      ),
                                                      Text(
                                                        'Status: $_status',
                                                        style: TextStyle(color: _statusColor),
                                                      ),

                                                      InkWell(
                                                        onTap: (){},
                                                        child: Container(
                                                          height: 50,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              borderRadius:BorderRadius.circular(30.0),
                                                              gradient: const LinearGradient(
                                                                  colors: [
                                                                    Color(0xFF2C3949),
                                                                    Color(0xFF2D4E89)
                                                                  ],
                                                                  begin: FractionalOffset(0.2, 0.0),
                                                                  end: FractionalOffset(1.0, 0.6),
                                                                  stops: [0.0,0.6],
                                                                  tileMode: TileMode.clamp
                                                              )
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "ACEPTAR",
                                                              style: TextStyle(
                                                                  fontSize: 16.0,
                                                                  fontFamily: "Lato",
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                            ),
                                          )

                                        ],
                                      )
                                    );
                                  }
                                );
                              }
                          );
                          //Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.settings, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Settings',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'PoppinsMedium'),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
            Container(
              height: 350,
              width: 350,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, posicion) {
                  return Card(
                    color: Colors.blueGrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/img/cafe_negro.jpeg', scale: 2.4,),
                        SizedBox(width: 3,),
                        Text("Maria con 2 de azucar")
                      ],
                    )
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }

}