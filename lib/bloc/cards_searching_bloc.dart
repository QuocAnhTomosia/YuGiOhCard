// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:yugi_oh_cards/models/card_model.dart';
import 'package:yugi_oh_cards/services/cards_api_services.dart';

part 'cards_searching_event.dart';
part 'cards_searching_state.dart';

class CardsSearchingBloc
    extends Bloc<CardsSearchingEvent, CardsSearchingState> {
  CardsSearchingBloc() : super(CardsSearchingInitial()) {
    on<CardsSearchingEvent>((event, emit) {});
    on<CardSearchingStarted>((event, emit) async {
      emit(CardSearchingLoading());
    });
    on<CardSearchingSubmit>((event, emit) async {
      if (state != CardSearchingLoading) {
        emit(CardSearchingLoading());
        final data = await CardApi().fetchData(event.name);
        if (data.list.length !=0) {
          print(data.list);
          emit(CardSearchingLoaded(data: data.list));
        } else {
          emit(CardSearchingError(respone: data.error));
        }
        
      }
    });
  }
}
