// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hotel_bloc.dart';

abstract class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelState {
  @override
  List<Object> get props => [];
}

class HotelloadingState extends HotelState {
  @override
  List<Object> get props => [];
}

class Hotelloadedstate extends HotelState {
  List<HotelModel> hotel;
  Hotelloadedstate({
    required this.hotel,
  });
  @override
  List<Object> get props => [hotel];
}

class HotelfailureState extends HotelState {
  String message;
  HotelfailureState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
