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
                          setState(() {
                            
                          });
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
