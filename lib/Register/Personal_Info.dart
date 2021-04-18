import 'package:bt5_backend/HomePage.dart';
import 'package:bt5_backend/WelcomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController number = TextEditingController();
  DateTime pickedDate;
  String dropDownValue;
  List listDropDownItem = [
    '+1 America',
    '+7 Russian',
    '+44 British',
    '+84 Vietnam',
    '+81 Japan',
    '+86 China',
    '+82 Korea'
  ];

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('Personal Infomation'),
        actions: [TextButton(onPressed: () {}, child: Icon(Icons.person))],
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: name,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle:
                          TextStyle(color: Colors.white, fontSize: 15))),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: address,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle:
                          TextStyle(color: Colors.white, fontSize: 15))),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: number,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Number',
                      labelStyle:
                          TextStyle(color: Colors.white, fontSize: 15))),
              SizedBox(
                height: 10,
              ),
              Container(
                child: DropdownButton(
                  hint: Text(
                    'Select Dial',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: dropDownValue,
                  onChanged: (newValue) {
                    setState(() {
                      dropDownValue = newValue;
                    });
                  },
                  dropdownColor: Colors.grey[900],
                  items: listDropDownItem.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date of Birth:",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    ListTile(
                      title: Text(
                        'Date: ${pickedDate.year}, ${pickedDate.month}, ${pickedDate.day}',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      onTap: _pickedDate,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: AlignmentDirectional.centerStart,
                            end: AlignmentDirectional.centerEnd,
                            colors: [Colors.redAccent, Colors.orangeAccent]),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton(
                        onPressed: () {
                          Map<String, dynamic> data = {
                            'Name': name.text,
                            'Address': address.text,
                            'Phone Number': number.text,
                            'Number Area': dropDownValue,
                            'Date of Birth': pickedDate
                          };
                          FirebaseFirestore.instance
                              .collection('UserData')
                              .doc('testUser')
                              .set(data);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage()));
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _pickedDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 10));

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }
}
