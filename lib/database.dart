import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUsers extends StatelessWidget {
  final String name;
  final String address;
  final String number;
  final DateTime dateTime;
  AddUsers(this.name, this.address, this.number, this.dateTime);
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Future<void> addUsers() {
      return users
          .add({
            'name': name,
            'address': address,
            'number': number,
            'dateTime': dateTime,
          })
          .then((value) => print('User Added'))
          .catchError((error) => print('Failed to add user: &error'));
    }

    return TextButton(onPressed: addUsers, child: Text('Add User'));
  }
}
