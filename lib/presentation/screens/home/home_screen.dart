// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/business_logic/hotel/hotel_bloc.dart';
import 'package:review_app/data/model/hotel_model.dart';
import 'package:review_app/presentation/screens/home/components/custom_drawer.dart';
import 'package:review_app/presentation/screens/home/components/single_page.dart';
import 'package:review_app/presentation/screens/home/components/slider_container.dart';
import 'package:review_app/presentation/screens/popular/popular_screen.dart';
import 'package:review_app/presentation/widgets/custom_row.dart';

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
                      return InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, PopularScreen.routeName,
                              arguments: PopularScreen(type: items[index]));
                        },
                        child: Center(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(items[index].toString()),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            IndividualHotel(),
          ],
        ),
      ),
    );
  }
}

class IndividualHotel extends StatefulWidget {
  const IndividualHotel({
    Key? key,
  }) : super(key: key);

  @override
  State<IndividualHotel> createState() => _IndividualHotelState();
}

class _IndividualHotelState extends State<IndividualHotel> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelloadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Hotelloadedstate) {
          List<HotelModel> info = state.hotel;

          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              itemCount: info.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      SinglePage.routeName,
                      arguments: SinglePage(
                          lat: info[index].lat,
                          features: info[index].features,
                          lng: info[index].lng,
                          des: info[index].des,
                          image: info[index].image,
                          location: info[index].location,
                          name: info[index].name,
                          price: info[index].price,
                          amenities: info[index].amenities
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
                              image: NetworkImage(info[index].image),
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
                              info[index].name,
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
                              info[index].des,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        info[index].location,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '  \$ ${info[index].price}.0 per night  ',
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
                                        '( ${info[index].rating} )',
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
        } else if (state is HotelfailureState) {
          return Text(state.message);
        }
        return Container();
      },
    );
  }
}
