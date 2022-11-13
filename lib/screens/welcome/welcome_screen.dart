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
  String _chosenValue;

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
                                dropdownColor: Colors.brown,
                                value: _chosenValue,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black),
                                iconEnabledColor: Colors.black,
                                items: <String>[
                                  "Agartala",
                                  "Agra",
                                  "Agumbe",
                                  "Ahmedabad",
                                  "Aizawl",
                                  "Ajmer",
                                  "Alappuzha Beach",
                                  "Allahabad",
                                  "Alleppey",
                                  "Almora",
                                  "Amarnath",
                                  "Amritsar",
                                  "Anantagir",
                                  "Andaman and Nicobar Islands",
                                  "Araku valley",
                                  "Aurangabad",
                                  "Ayodhya",
                                  "Badrinath",
                                  "Bangalore",
                                  "Baroda",
                                  "Bastar",
                                  "Bhagalpur",
                                  "Bhilai",
                                  "Bhimtal",
                                  "Bhopal",
                                  "Bhubaneswar",
                                  "Bhuj",
                                  "Bidar",
                                  "Bilaspur",
                                  "Bodh Gaya",
                                  "Calicut",
                                  "Chail",
                                  "Chamba",
                                  "Chandigarh",
                                  "Chennai",
                                  "Chennai Beaches",
                                  "Cherai",
                                  "Cherrapunji",
                                  "Chidambaram",
                                  "Chikhaldara Hills",
                                  "Chopta",
                                  "Coimbatore",
                                  "Coonoor",
                                  "Coorg",
                                  "Corbett National Park",
                                  "Cotigao Wild Life Sanctuary",
                                  "Cuttack",
                                  "Dadra and Nagar Haveli",
                                  "Dalhousie",
                                  "Daman and Diu",
                                  "Darjeeling",
                                  "Dehradun",
                                  "Delhi",
                                  "Devikulam",
                                  "Dhanaulti",
                                  "Dharamashala",
                                  "Dindigul",
                                  "Dudhwa National Park",
                                  "Dwaraka",
                                  "Faridabad",
                                  "Gandhinagar",
                                  "Gangotri",
                                  "Gangtok",
                                  "Gir Wildlife Sanctuary",
                                  "Goa",
                                  "Great Himalayan National Park",
                                  "Gulmarg",
                                  "Gurgaon",
                                  "Guruvayoor",
                                  "Guwahati",
                                  "Gwalior",
                                  "Hampi",
                                  "Haridwar",
                                  "Hogenakkal",
                                  "Horsley Hills",
                                  "Hyderabad",
                                  "Idukki",
                                  "Imphal",
                                  "Indore",
                                  "Itangar",
                                  "Jabalpur",
                                  "Jaipur",
                                  "Jaisalmer",
                                  "Jalandhar",
                                  "Jammu",
                                  "Jamshedpur",
                                  "Jodhpur",
                                  "Kanchipuram",
                                  "Kanha National Park",
                                  "Kanpur",
                                  "Kanyakumari",
                                  "Kargil",
                                  "Karwar",
                                  "Kausani",
                                  "Kedarnath",
                                  "Keoladeoghana National Park",
                                  "Khajuraho",
                                  "Kochi",
                                  "Kodaikanal",
                                  "Kolkata",
                                  "Kollam",
                                  "Konark",
                                  "Kotagiri",
                                  "Kottakkal and Ayurveda",
                                  "Kovalam",
                                  "Kovalam and Ayurveda",
                                  "Kudremukh",
                                  "Kullu",
                                  "Kumaon",
                                  "Kumarakom",
                                  "Kumarakom and Ayurveda",
                                  "Kumarakom Bird Sanctuary",
                                  "Kurukshetra",
                                  "Lakshadweep",
                                  "Lucknow",
                                  "Ludhiana",
                                  "Madurai",
                                  "Mahabalipuram",
                                  "Malpe Beach",
                                  "Manas National Park",
                                  "Mangalore",
                                  "Maravanthe Beach",
                                  "Margoa",
                                  "Mount Abu",
                                  "Mumbai",
                                  "Munnar",
                                  "Mussoorie",
                                  "Mysore",
                                  "Nahsik",
                                  "Nalanda",
                                  "Nanda Devi National Park",
                                  "Nandi Hills",
                                  "Netravali Wild Life Sanctuary",
                                  "Ooty",
                                  "Orchha",
                                  "Pahalgam",
                                  "Palakkad",
                                  "Panchgani",
                                  "Patna",
                                  "Patnitop",
                                  "Pattadakkal",
                                  "Periyar Wildlife Sanctuary",
                                  "Pithoragarh",
                                  "Pondicherry",
                                  "Pune",
                                  "Puri",
                                  "Pushkar",
                                  "Raipur",
                                  "Rajaji National Park",
                                  "Rajgir",
                                  "Rameshwaram",
                                  "Ranchi",
                                  "Ranganthittu Bird Sanctuary",
                                  "Ranikhet",
                                  "Ranthambore",
                                  "Rishikesh",
                                  "Rourkela",
                                  "Sanchi",
                                  "Saputara",
                                  "Sariska Wildlife Sanctuary",
                                  "Shillong",
                                  "Shimla",
                                  "Sohna_Hills",
                                  "Srinagar",
                                  "Sunderbans",
                                  "Surat",
                                  "Tezpur",
                                  "Thanjavur",
                                  "Thiruvananthapuram",
                                  "Thrissur",
                                  "Tirunelveli",
                                  "Tirupati",
                                  "Trichy",
                                  "Udaipur",
                                  "Ujjain",
                                  "Vaishali",
                                  "Valley of Flowers",
                                  "Varanasi",
                                  "Varkala and Ayurveda",
                                  "Vijayawada",
                                  "Vishakhapatnam",
                                  "Vrindhavan",
                                  "Warangal",
                                  "Wayanad",
                                  "Wayanad Wildlife Sanctuary",
                                  "Yercaud",
                                  "Zanskar",
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
                                onChanged: (String value) {
                                  setState(() {
                                    _chosenValue = value;
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
