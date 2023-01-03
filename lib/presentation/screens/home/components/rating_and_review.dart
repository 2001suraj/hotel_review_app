// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/business_logic/hotel/hotel_bloc.dart';
import 'package:review_app/data/local_storage/share_preference.dart';
import 'package:review_app/data/model/hotel_model.dart';
import 'package:review_app/presentation/screens/home/components/room_features.dart';
import 'package:review_app/presentation/widgets/show_snack_bar.dart';

class RatingAndReviewRow extends StatelessWidget {
  RatingAndReviewRow({Key? key, required this.name}) : super(key: key);
  String name;

  TextEditingController feedback = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            if (state is HotelloadingState) {
              return Center(
                child: SizedBox(
                    width: 100,
                    height: 10,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      color: Colors.blue,
                    )),
              );
            } else if (state is Hotelloadedstate) {
              List<HotelModel> info = state.hotel;

              return Container(
                height: MediaQuery.of(context).size.height * 0.028,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    if (info[index].name == name) {
                      return Row(
                        children: [
                          //rating
                          RatingBarWidget(
                            rating: info[index].individualrating,
                            name: name,
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Text(
                                              'Comment',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor: Colors.black,
                                                  child: CircleAvatar(
                                                    radius: 23,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    child: CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage(
                                                          'assets/images/signup.png'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              SizedBox(
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                child: TextField(
                                                  controller: feedback,
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                  maxLines: 1,
                                                  decoration: InputDecoration(
                                                    suffixIcon: FutureBuilder(
                                                        future: LocalStorage()
                                                            .readdata(),
                                                        builder: (context,
                                                            snapshot) {
                                                          return InkWell(
                                                            onTap: () {
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'all_hotel')
                                                                  .doc(name)
                                                                  .update({
                                                                'review': FieldValue
                                                                    .arrayUnion([
                                                                  feedback.text
                                                                ]
                                                                        .map((e) =>
                                                                            {
                                                                              'user': '${snapshot.data}',
                                                                              'user_image': 'user_image',
                                                                              'comment': feedback.text,
                                                                              'like': [],
                                                                              'unlike': [],
                                                                              'click': false
                                                                            })
                                                                        .toList()),
                                                              });
                                                              context.read<
                                                                  HotelBloc>()
                                                                ..add(
                                                                    GetHotelEvent());

                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Icon(
                                                              Icons.send,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          );
                                                        }),
                                                    hintText:
                                                        'Add a comment ...',
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 2,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                primary: false,
                                                itemCount:
                                                    info[index].review.length,
                                                itemBuilder: (context, index1) {
                                                  return Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 25,
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                                child:
                                                                    CircleAvatar(
                                                                  radius: 23,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .grey,
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius: 20,
                                                                    backgroundImage: NetworkImage(info[
                                                                            index]
                                                                        .review[
                                                                            index1]
                                                                        .user_image),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Text(
                                                                info[index]
                                                                    .review[
                                                                        index1]
                                                                    .user,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ],
                                                          ),
                                                          PopupMenuButton<int>(
                                                            itemBuilder:
                                                                (context) => [
                                                              PopupMenuItem(
                                                                value: 1,
                                                                child: Row(
                                                                  children: const [
                                                                    Icon(Icons
                                                                        .report_gmailerrorred),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                        "Report")
                                                                  ],
                                                                ),
                                                              ),
                                                              PopupMenuItem(
                                                                value: 2,
                                                                child: Row(
                                                                  children: const [
                                                                    Icon(Icons
                                                                        .report_gmailerrorred),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                        "delete")
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                            offset:
                                                                Offset(0, 40),
                                                            color: Colors.white,
                                                            elevation: 2,
                                                            onSelected:
                                                                (value) {
                                                              if (value == 1) {
                                                                _showDialog(
                                                                    context,
                                                                    report: '');
                                                              }
                                                              if (value == 2) {
                                                                _showDialog1(
                                                                    context,
                                                                    user: info[index]
                                                                        .review[
                                                                            index1]
                                                                        .user,
                                                                    user_image: info[
                                                                            index]
                                                                        .review[
                                                                            index1]
                                                                        .user_image,
                                                                    comment: info[
                                                                            index]
                                                                        .review[
                                                                            index1]
                                                                        .comment,
                                                                    click: info[
                                                                            index]
                                                                        .review[
                                                                            index1]
                                                                        .click,
                                                                    like: info[
                                                                            index]
                                                                        .review[
                                                                            index1]
                                                                        .like,
                                                                    unlike: info[
                                                                            index]
                                                                        .review[
                                                                            index1]
                                                                        .unlike);
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 10,
                                                            left: 60),
                                                        child: FutureBuilder(
                                                            future:
                                                                LocalStorage()
                                                                    .readdata(),
                                                            builder: (context,
                                                                snap) {
                                                              return Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    info[index]
                                                                        .review[
                                                                            index1]
                                                                        .comment,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                  LIkeUnLIkeRow(),
                                                                ],
                                                              );
                                                            }),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              ' ( ${info[index].review.length} Reviews ) ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              );
            } else if (state is HotelfailureState) {
              return Text(state.message);
            }
            return Container();
          },
        ),
      ],
    );
  }

  void _showDialog(
    BuildContext context, {
    required String report,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Report Comment "),
          content: Container(
            margin: EdgeInsets.all(5),
            child: TextField(
              // controller: controller,
              style: TextStyle(color: Colors.white),
              maxLength: 500,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Report Here',
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                filled: true,
                fillColor: Colors.grey,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 2)),
              ),
            ),
          ),
          actions: [
            MaterialButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              child: Text(
                "Report",
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                showsnackBar(
                    context: context,
                    text: 'Reported successfully',
                    color: Colors.green);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog1(
    BuildContext context, {
    required String user,
    required String user_image,
    required String comment,
    required bool click,
    required List<String> like,
    required List<String> unlike,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Do you want to delete your comment ? "),
          actions: [
            MaterialButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('all_hotel')
                    .doc(name)
                    .update({
                  'review': FieldValue.arrayRemove([feedback.text]
                      .map((e) => {
                            'user': user,
                            'user_image': user_image,
                            'comment': comment,
                            'like': like,
                            'unlike': unlike,
                            'click': click
                          })
                      .toList()),
                });
                context.read<HotelBloc>()..add(GetHotelEvent());
                showsnackBar(
                    context: context,
                    text: 'Deleted successfully',
                    color: Colors.green);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LIkeUnLIkeRow extends StatefulWidget {
  LIkeUnLIkeRow({
    Key? key,
  }) : super(key: key);

  @override
  State<LIkeUnLIkeRow> createState() => _LIkeUnLIkeRowState();
}

class _LIkeUnLIkeRowState extends State<LIkeUnLIkeRow> {
  bool click = false;
  bool click1 = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            setState(() {
              click = !click;
              click1 = true;
            });
          },
          minWidth: 60,
          child: click
              ? Icon(
                  Icons.thumb_up,
                  color: Colors.blue,
                )
              : Icon(Icons.thumb_up_off_alt_outlined),
        ),
        MaterialButton(
          onPressed: () {
            setState(() {
              click1 = !click1;
              click = false;
            });
          },
          minWidth: 60,
          child: click1
              ? Icon(Icons.thumb_down_off_alt_outlined)
              : Icon(
                  Icons.thumb_down,
                  color: Colors.blue,
                ),
        )
      ],
    );
  }
}
