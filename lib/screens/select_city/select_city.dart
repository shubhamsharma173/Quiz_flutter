import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {


  Map<String, String> stateCity = {
    "Surat": "Gujarat",
    "Ahmadabad": "Gujarat",
    "Vadodara": "Gujarat",
    "Mp1": "Mp",
    "Mp2": "Mp",
    "Up1": "Up",
    "Up2": "Up",
    "Up3": "Up",
  };

  List<String> state = ['Gujarat','Mp','Up'];
  List<String>  city= [];

  String selectedState;
  String selectedcity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButton(
                onChanged: (value) {
                  setState(() {
                    selectedState = value;
                    selectedcity =null;
                    city.clear();
                    stateCity.forEach((k,v){
                      print(k);
                      if(selectedState==v){
                        city.add(k);
                      }
                    });
                  });
                },
                value: selectedState,
                items: state
                    .map((state) => DropdownMenuItem(
                  child: Text(state),
                  value: state,
                ))
                    .toList(),
              ),
              DropdownButton(
                onChanged: (value) {
                  setState(() {
                    selectedcity = value;
                  });
                  print(value);
                },
                value: selectedcity,
                items: selectedState !=  null ? city.map((city) => DropdownMenuItem(child: Text(city),value: city,)).toList(): [],
              )
            ],
          ),
        ),
      ),
    );
  }
}