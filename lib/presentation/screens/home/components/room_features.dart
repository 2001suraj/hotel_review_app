import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:review_app/business_logic/hotel/hotel_bloc.dart';
class RoomFeatures extends StatelessWidget {
  RoomFeatures({
    Key? key,
    required this.features,
  }) : super(key: key);

  final List<String> features;
  List<IconData> icons = [
    Icons.ac_unit,
    Icons.room_service,
    Icons.safety_check_rounded,
    Icons.tv
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 20, left: 10),
            height: 80,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icons[index],
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  features[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RatingBarWidget extends StatefulWidget {
  RatingBarWidget({Key? key, required this.rating, required this.name})
      : super(key: key);
  double rating;
  String name;

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text('Rating: $rating '),
        RatingBar.builder(
            initialRating: widget.rating,
            itemSize: 20,
            minRating: 1,
            updateOnDrag: true,
            itemBuilder: (context, index) {
              return Icon(Icons.star, color: Colors.yellow);
            },
            onRatingUpdate: (rating) {
              setState(() {
                widget.rating = rating;
                FirebaseFirestore.instance
                    .collection('all_hotel')
                    .doc(widget.name)
                    .update({'individualrating': widget.rating});
                context.read<HotelBloc>()..add(GetHotelEvent());
                // Navigator.pushReplacementNamed(context, MainScreen.routeName);
              });
            }),
      ],
    );
  }
}