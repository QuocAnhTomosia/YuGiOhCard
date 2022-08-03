// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_print

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:yugi_oh_cards/commons/constant.dart';
import 'package:yugi_oh_cards/models/card_model.dart';
import 'package:yugi_oh_cards/services/cards_api_services.dart';

part 'cards_searching_event.dart';
part 'cards_searching_state.dart';

class CardsSearchingBloc
    extends Bloc<CardsSearchingEvent, CardsSearchingState> {
  CardsSearchingBloc() : super(CardsSearchingInitial()) {
    on<CardsSearchingEvent>((event, emit) {});
    on<CardSearchingStarted>((event, emit) async {
      emit(const CardSearchingLoaded(data: []));
    });
    on<CardSearchingSubmit>((event, emit) async {
      // ignore: unrelated_type_equality_checks
      if (state != CardSearchingLoading) {
        emit(CardSearchingLoading());
        final data = await CardApi().fetchData(event.name, event.language);
        if (data.list.isNotEmpty) {
          emit(CardSearchingLoaded(data: data.list));
        } else {
          emit(CardSearchingError(respone: data.error));
        }
      }
    });
    on<CardRandomSubit>(((event, emit) async {
      if (state != CardSearchingLoading) {
        emit(CardSearchingLoading());
        Random random = new Random();
        List<int> randomList = [];
        for (int i = 0; i < 6; i++) {
          randomList.add(Constant()
              .randomNumbers[random.nextInt(Constant().randomNumbers.length)]);
        }
        print(randomList.length);
        final data = await CardApi().fetchId(randomList, tr("lang"));

        if (data.list.isNotEmpty) {
          emit(CardSearchingLoaded(data: data.list));
        } else {
          emit(const CardSearchingError(respone: "error"));
        }
      }
    }));
    on<CardSearchingIdSubmit>((event, emit) async {
      if (state != CardSearchingLoading) {
        emit(CardSearchingLoading());
        final data = await CardApi().fetchId(event.list, event.language);
        if (data.list.isNotEmpty) {
          print("length of data${data.list.length}");
          emit(CardSearchingLoaded(data: data.list));
        } else {
          emit(CardSearchingError(respone: data.error));
        }
      }
    });
  }
}
