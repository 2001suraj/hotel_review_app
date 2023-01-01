import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:review_app/data/model/hotel_model.dart';
import 'package:review_app/data/repo/hotel_repo.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelRepo repo;
  HotelBloc(HotelRepo hotelRepo)
      : repo = hotelRepo,
        super(HotelInitial()) {
    on<HotelEvent>((event, emit) async {
      if (event is GetHotelEvent) {
        emit(HotelloadingState());
        try {
          final data = await repo.gethotel();
          emit(Hotelloadedstate(hotel: data));
        } catch (e) {
          emit(HotelfailureState(message: e.toString()));
        }
      }
    });
  }
}
