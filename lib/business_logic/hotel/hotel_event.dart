// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hotel_bloc.dart';

abstract class HotelEvent extends Equatable {
  const HotelEvent();

  @override
  List<Object> get props => [];
}

class GetHotelEvent extends HotelEvent {
  @override
  List<Object> get props => [];
}

class GetPopularHotelEvent extends HotelEvent {
  String name;
  GetPopularHotelEvent({
    required this.name,
  });
  @override
  List<Object> get props => [name];
}
class GetNearyouHotelEvent extends HotelEvent {
  String name;
  GetNearyouHotelEvent({
    required this.name,
  });
  @override
  List<Object> get props => [name];
}
class GetAdvantureHotelEvent extends HotelEvent {
  String name;
  GetAdvantureHotelEvent({
    required this.name,
  });
  @override
  List<Object> get props => [name];
}
