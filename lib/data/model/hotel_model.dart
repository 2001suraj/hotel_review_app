import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HotelModel {
  String name;
  String price;
  double rating;
  double individualrating;
  String location;
  String des;
  String lat;
  String lng;
  String image;
  List<String> features;
  List<String> amenities;
  List<ReView> review;
  String category;
  HotelModel({
    required this.name,
    required this.price,
    required this.lat,
    required this.lng,
    required this.rating,
    required this.individualrating,
    required this.review,
    required this.des,
    required this.location,
    required this.image,
    required this.features,
    required this.amenities,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'rating': rating,
      'individualrating': individualrating,
      'location': location,
      'des': des,
      'lat': lat,
      'lng': lng,
      'image': image,
      'features': features,
      'amenities': amenities,
      'review': review.map((x) => x.toMap()).toList(),
      'category': category,
    };
  }

  factory HotelModel.fromMap(Map<String, dynamic> map) {
    return HotelModel(
      name: map['name'],
      price: map['price'],
      rating: map['rating'],
      individualrating: map['individualrating'],
      location: map['location'],
      des: map['des'],
      lat: map['lat'],
      lng: map['lng'],
      image: map['image'],
      features: List<String>.from((map['features'])),
      amenities: List<String>.from((map['amenities'])),
      review: List<ReView>.from(
        (map['review'] as List<dynamic>).map<ReView>(
          (x) => ReView.fromMap(x as Map<String, dynamic>),
        ),
      ),
      category: map['category'],
    );
  }
}

class ReView {
  String user;
  String user_image;
  String comment;
  List<String> like;
  List<String> unlike;
  bool click;
  ReView({
    required this.user,
    required this.user_image,
    required this.comment,
    required this.like,
    required this.unlike,
    required this.click,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'user_image': user_image,
      'comment': comment,
      'like': like,
      'unlike': unlike,
      'click': click,
    };
  }

  factory ReView.fromMap(Map<String, dynamic> map) {
    return ReView(
      user: map['user'],
      user_image: map['user_image'],
      comment: map['comment'],
            like: List<String>.from((map['like'])),
            unlike: List<String>.from((map['unlike'])),
      
      click: map['click'] as bool,
    );
  }
}
