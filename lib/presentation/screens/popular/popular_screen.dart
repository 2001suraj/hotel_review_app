import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/business_logic/hotel/hotel_bloc.dart';
import 'package:review_app/data/model/hotel_model.dart';
import 'package:review_app/presentation/screens/home/components/single_page.dart';
import 'package:review_app/presentation/screens/main_screen.dart';

class PopularScreen extends StatelessWidget {
  static const String routeName = 'PopulaScreen';
  PopularScreen({super.key, required this.type});
  String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            if (state is HotelloadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Hotelloadedstate) {
              List<HotelModel> info = state.hotel;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, MainScreen.routeName);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                  Container(
                    height: 80,
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.mic),
                        hintStyle: TextStyle(letterSpacing: 2.0),
                        filled: true,
                        fillColor: Colors.blue.withOpacity(0.2),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Text(
                          type,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(10),
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
                                width: 320,
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                decoration: (BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(info[index].image),
                                      fit: BoxFit.cover),
                                )),
                              ),
                              Container(
                                height: 300,
                                width: 320,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                padding: EdgeInsets.all(15),
                                decoration: (BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withOpacity(0.5),
                                )),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.4,
                                right: 0,
                                left: 0,
                                child: Container(
                                  height: 150,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  padding: EdgeInsets.all(15),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //name
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.65,
                                        child: Text(
                                          info[index].name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      //row  of location price rating
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.black,
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.65,
                                                child: Text(
                                                  info[index].location,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            '  \$ ${info[index].price}.0 per night  ',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 13,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star_half,
                                                color: Colors.yellow,
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                '( ${info[index].rating} )',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is HotelfailureState) {
              return Text(state.message);
            }
            return Container();
          },
        ),
      )),
    );
  }
}
