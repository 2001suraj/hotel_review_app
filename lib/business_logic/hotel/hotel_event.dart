part of 'hotel_bloc.dart';

abstract class HotelEvent extends Equatable {
  const HotelEvent();

  @override
  List<Object> get props => [];
}
class GetHotelEvent extends HotelEvent{}