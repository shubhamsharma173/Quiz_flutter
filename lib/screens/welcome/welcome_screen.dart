import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/data_controller.dart';
import 'package:quiz_app/screens/rules/rules.dart';
import '../../../screens/leaderboard/leaderboard.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  WelcomeScreenState createState() => new WelcomeScreenState();
}

class WelcomeScreenState extends State {
  DataController _controller = Get.put(DataController());
  late String _chosenValue;

  @override
  void initState() {
    super.initState();
    // Initialize _chosenValue with a default value
    _chosenValue = "Agra"; // Replace with an appropriate default value
  }

  cityField() {
    return (_chosenValue == "Other"
        ? TextField(
            controller: _controller.textController_3,
            onChanged: (val) {
              this.setState(() {
                _controller.buttonEnabled = _controller.checkTextFieldEmpty();
              });
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF2BD8B),
              hintText: "City",
              hintStyle: TextStyle(color: Colors.black),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          )
        : Container());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcomebg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                // Flutter show the back button automatically
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.leaderboard,
                      color: Colors.white,
                    ),
                    onPressed: () => {Get.to(LeaderboardScreen())},
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(flex: 6),
                          //2/6
                          // Text(
                          //   "Let's Play Quiz,",
                          //   style: Theme.of(context).textTheme.headline4.copyWith(
                          //       color: Colors.white, fontWeight: FontWeight.bold),
                          // ),
                          // Text("Enter your details below"),
                          // Spacer(), // 1/6
                          TextField(
                            controller: _controller.textController_1,
                            onChanged: (val) {
                              this.setState(() {
                                _controller.buttonEnabled =
                                    _controller.checkTextFieldEmpty();
                              });
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF2BD8B),
                              hintText: "Full Name",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          Spacer(),
                          TextField(
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            // Only numbers can be entered
                            controller: _controller.textController_2,
                            onChanged: (val) {
                              this.setState(() {
                                _controller.buttonEnabled =
                                    _controller.checkTextFieldEmpty();
                              });
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: Color(0xFFF2BD8B),
                              hintText: "Mobile No.",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          Spacer(),
                          // 1/6
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6.3, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color(0xFFF2BD8B),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: SizedBox(),
                                focusColor: Colors.black,
                                dropdownColor: Color(0xFFF2BD8B),
                                value: _chosenValue,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black),
                                iconEnabledColor: Colors.black,
                                items: <String>[
                                  'Agra',
                                  'Aligarh',
                                  'Allahabad',
                                  'Ambedkar Nagar',
                                  'Amethi',
                                  'Auraiya',
                                  'Azamgarh',
                                  'Badaun',
                                  'Baghpat',
                                  'Bahraich',
                                  'Ballia',
                                  'Balrampur',
                                  'Banda',
                                  'Barabanki',
                                  'Bareilly',
                                  'Basti',
                                  'Bhadoi',
                                  'Bhopal',
                                  'Bijnore',
                                  'Bulandshahar',
                                  'Chandauli',
                                  'Chitrakoot',
                                  'Deoria',
                                  'Etah',
                                  'Etawah',
                                  'Faizabad',
                                  'Farrukhabad',
                                  'Fatehpur',
                                  'Firozabad',
                                  'Gazipur',
                                  'Ghaziabad',
                                  'Gonda',
                                  'Gorakhpur',
                                  'Gwalior',
                                  'Hamirpur',
                                  'Hapur',
                                  'Hardoi',
                                  'Hathras',
                                  'Indore',
                                  'J.P.Nagar',
                                  'Jabalpur',
                                  'Jalaun',
                                  'Jaunpur',
                                  'Jhansi',
                                  'Kannoj',
                                  'Kanpur',
                                  'Kanpur Dehat',
                                  'Kashganj',
                                  'Kaushambi',
                                  'Khiri',
                                  'Kushinagar',
                                  'Lalitpur',
                                  'Lucknow',
                                  'Maharajganj',
                                  'Mahoba',
                                  'Mainpuri',
                                  'Mathura',
                                  'Mau',
                                  'Meerut',
                                  'Mirzapur',
                                  'Moradabad',
                                  'Muzaffar nagar',
                                  'New Indore',
                                  'Noida',
                                  'Pilibhit',
                                  'Pratapgarh',
                                  'Raebareli',
                                  'Rampur',
                                  'Rewa',
                                  'Saharanpur',
                                  'Sambhal',
                                  'Sant Kabir Nagar',
                                  'Shahjahanpur',
                                  'Shamli',
                                  'Shrawasti',
                                  'Siddharth Nagar',
                                  'Sitapur',
                                  'Sonbhadra',
                                  'Sultanpur',
                                  'Ujjain',
                                  'Unnao',
                                  'Varanasi',
                                  "Other",
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                hint: Text(
                                  "Please choose a City",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _chosenValue = value!;
                                    _controller.changeCity(value);
                                    _controller.buttonEnabled =
                                        _controller.checkTextFieldEmpty();
                                  });
                                },
                              )),
                          Spacer(),
                          cityField(),
                          Spacer(),
                          ElevatedButton(
                            onPressed: _controller.buttonEnabled
                                ? () => {Get.to(() => RulesScreen())}
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                            ),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(kDefaultPadding * 0.75),
                              // 15
                              decoration: BoxDecoration(
                                gradient: _controller.buttonEnabled
                                    ? kPrimaryGradient
                                    : kSecondaryGradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Spacer(flex: 2),
                          // it will take 2/6 spaces
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
