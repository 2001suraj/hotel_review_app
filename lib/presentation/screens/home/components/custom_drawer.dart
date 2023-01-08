// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:review_app/data/local_storage/share_preference.dart';
import 'package:review_app/presentation/screens/profile/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/signup.png'),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 80,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: FutureBuilder(
                        future: LocalStorage().readdata(),
                        builder: (context, snapshot) {
                          return StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('user')
                                  .snapshots(),
                              builder:
                                  (context, AsyncSnapshot<QuerySnapshot> snap) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      child: ListView.builder(
                                          itemCount: snap.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            if (snapshot.data.toString() ==
                                                snap.data!.docs[index]
                                                    ['email']) {
                                              return Text(
                                                snap.data!.docs[index]['name']
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black),
                                              );
                                            } else {
                                              return Text('data');
                                            }
                                          }),
                                    ),
                                    Text(snapshot.data.toString())
                                  ],
                                );
                              });
                        }),
                  )
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
