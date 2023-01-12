import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:review_app/data/model/hotel_model.dart';

class HotelRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<HotelModel>> gethotel() async {
    List<HotelModel> hotel = [];
    try {
      final response =
          await FirebaseFirestore.instance.collection('all_hotel').get();
   
      response.docs.forEach((element) {
        return hotel.add(HotelModel.fromMap(element.data()));
      });
      return hotel;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('failed with error:' '${e.code}' + ':' + '${e.message}');
      }
      return hotel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  Future<List<HotelModel>> popular() async {
    List<HotelModel> hotel = [];
    try {
      final response =
          // await FirebaseFirestore.instance.collection('all_hotel').get();
          await FirebaseFirestore.instance
              .collection('all_hotel')
              .where('category', isEqualTo: 'popular')
              .get();
      response.docs.forEach((element) {
        return hotel.add(HotelModel.fromMap(element.data()));
      });
      return hotel;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('failed with error:' '${e.code}' + ':' + '${e.message}');
      }
      return hotel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  Future<List<HotelModel>> nearyou() async {
    List<HotelModel> hotel = [];
    try {
      final response =
          // await FirebaseFirestore.instance.collection('all_hotel').get();
          await FirebaseFirestore.instance
              .collection('all_hotel')
              .where('category', isEqualTo: 'nearyou')
              .get();
      response.docs.forEach((element) {
        return hotel.add(HotelModel.fromMap(element.data()));
      });
      return hotel;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('failed with error:' '${e.code}' + ':' + '${e.message}');
      }
      return hotel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  Future<List<HotelModel>> advanture() async {
    List<HotelModel> hotel = [];
    try {
      final response =
          // await FirebaseFirestore.instance.collection('all_hotel').get();
          await FirebaseFirestore.instance
              .collection('all_hotel')
              .where('category', isEqualTo: 'advanture')
              .get();
      response.docs.forEach((element) {
        return hotel.add(HotelModel.fromMap(element.data()));
      });
      return hotel;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('failed with error:' '${e.code}' + ':' + '${e.message}');
      }
      return hotel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
