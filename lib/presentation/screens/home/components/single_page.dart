// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:review_app/presentation/screens/home/components/rating_and_review.dart';
import 'package:review_app/presentation/screens/home/components/room_features.dart';
import 'package:review_app/presentation/screens/main_screen.dart';

class SinglePage extends StatelessWidget {
  static const String routeName = 'single page';
  SinglePage({
    Key? key,
    required this.des,
    required this.image,
    required this.location,
    required this.name,
    required this.lat,
    required this.lng,
    required this.features,
    required this.amenities,
    // required this.rating
  }) : super(key: key);
  String name;
  String image;
  String des;
  // double rating;
  String location;
  String lat;
  String lng;
  List<String> features;
  List<String> amenities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          name,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, MainScreen.routeName);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),

              //rating and review
              RatingAndReviewRow(name: name),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 15,
              ),
              //description title
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //description
              Text(des),
              SizedBox(
                height: 15,
              ),
              //location
              Text(
                'location',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //map
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: GoogleMap(
                  markers: <Marker>{
                    Marker(
                        markerId: MarkerId('1'),
                        position: LatLng(double.parse(lat), double.parse(lng)),
                        infoWindow: InfoWindow(title: name))
                  },
                  initialCameraPosition: CameraPosition(
                    zoom: 15,
                    target: LatLng(double.parse(lat), double.parse(lng)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //title roome features
              Text(
                'Features',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //roome fearures
              RoomFeatures(features: features),
              SizedBox(
                height: 15,
              ),
              //amenities

              Text(
                'Amenities',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //amenities list
              SizedBox(
                height: 300,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  itemCount: amenities.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Text("${index + 1} : " + amenities[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
