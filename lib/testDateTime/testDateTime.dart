import 'package:flutter/material.dart';

class TestDateTime extends StatefulWidget {
  @override
  _TestDateTimeState createState() => _TestDateTimeState();
}

class _TestDateTimeState extends State<TestDateTime> {
  DateTime dateTime1;
  DateTime dateTime2;
  @override
  void initState() {
    super.initState();
    dateTime1 = DateTime.now();
    dateTime2 = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('Test Date Time'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 20),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date time 1',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                onTap: _pickDate1(),
              ),
              Text(
                'Date time 2',
                style: TextStyle(color: Colors.white),
              ),
              ListTile(
                title: Text(
                  'Date Time 2: ${dateTime2.day}/${dateTime2.month}/${dateTime2.year}',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                onTap: _pickDate2,
              ),
              Text(
                dateTime2.isAfter(dateTime1)
                    ? 'Date 2 is after date 1'
                    : 'Date 2 is before date 1',
                style: TextStyle(color: Colors.blueAccent),
              ),
              // Center(
              //   child: Container(
              //     height: 30,
              //     width: 100,
              //     decoration: BoxDecoration(
              //         color: Colors.blueAccent,
              //         borderRadius: BorderRadius.circular(50)),
              //     child: TextButton(
              //       child: Text(
              //         'Check',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       onPressed: () {},
              //     ),
              //   ),
              // ),
            ],
          ))),
    );
  }

  _pickDate1() async {
    DateTime date1 = await showDatePicker(
        context: context,
        initialDate: dateTime1,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 10));
    if (date1 != null) {
      setState(() {
        dateTime1 = date1;
      });
    }
  }

  _pickDate2() async {
    DateTime date2 = await showDatePicker(
        context: context,
        initialDate: dateTime2,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 10));
    if (date2 != null) {
      dateTime2 = date2;
    }
  }
}
