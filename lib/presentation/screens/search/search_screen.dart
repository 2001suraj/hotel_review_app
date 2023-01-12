// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:review_app/data/model/hotel_model.dart';
import 'package:review_app/presentation/screens/home/components/single_page.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search recipe screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchScreen> {
  Stream<QuerySnapshot<Map<String, dynamic>>>? ff;
  String nam = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(40, 90),
            child: Container(
              margin: EdgeInsets.all(20),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search ...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    nam = value;
                  });
                },
              ),
            ),
          ),
        ),
        body: (nam != '' && nam != null)
            ? SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('all_hotel')
                          .where('key', arrayContains: nam)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var info = snapshot.data!.docs[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    SinglePage.routeName,
                                    arguments: SinglePage(
                                      lat: info['lat'],
                                      features: snapshot.data!.docs[index]
                                          ['features'],
                                      des: info['des'],
                                      image: info['image'],
                                      location: info['location'],
                                      name: info['name'],
                                      amenities: snapshot.data!.docs[index]
                                          ['amenities'],
                                      lng: info['lng'],
                                      // rating: info[index].rating,
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 300,
                                      width: 250,
                                      margin: EdgeInsets.all(15),
                                      padding: EdgeInsets.all(15),
                                      decoration: (BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(info['image']),
                                            fit: BoxFit.cover),
                                      )),
                                    ),
                                    Container(
                                      height: 300,
                                      width: 250,
                                      margin: EdgeInsets.all(15),
                                      padding: EdgeInsets.all(15),
                                      decoration: (BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black.withOpacity(0.5),
                                      )),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //name
                                          Text(
                                            info['name'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //des
                                          Text(
                                            info['des'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),

                                          // row  of location price rating
                                          FittedBox(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    SizedBox(
                                                      width: 120,
                                                      child: Text(
                                                        info['location'],
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      '( ${info['rating']} )',
                                                      style: TextStyle(
                                                        // fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                        ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Text(
                                snapshot.data!.docs[index]['name'].toString(),
                                style: TextStyle(color: Colors.white),
                              );
                            });
                      }),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/search.png'),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          'Search your favorite Restaurants',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 2),
                        ),
                      ),
                    ],
                  )),
                ),
              ));
  }
}
