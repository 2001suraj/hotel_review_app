// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:review_app/presentation/screens/home/components/custom_drawer.dart';
import 'package:review_app/presentation/screens/home/components/single_page.dart';
import 'package:review_app/presentation/screens/home/components/slider_container.dart';
import 'package:review_app/presentation/widgets/custom_row.dart';
import 'package:review_app/presentation/widgets/dot_indicator.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  HomeScreen({Key? key}) : super(key: key);
  List<String> items = [
    'Popular',
    'Advanture',
    'Near You',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SliderContainer(),
            CustomRow(text1: 'Explore Hotel', text2: 'View all', tap: () {}),
            Container(
              margin: EdgeInsets.all(15),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Center(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'All hotel',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(items[index].toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.pushReplacementNamed(context, SinglePage.routeName, arguments: SinglePage(des: des, image: image, location: location, name: name, price: price, rating: rating));
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
                          image: AssetImage('assets/images/hotel1.jpg'),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          'Hotel Name',
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
                          'Hotel descriptionHotel description Hotel description Hotel description Hotel description Hotel description Hotel description  ',
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

                        //row  of location price rating
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    'Nepal',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '  \$ 5.0 per Night  ',
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
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
                                    '( 5 )',
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
