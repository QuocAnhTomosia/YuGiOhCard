part of 'cards_searching_bloc.dart';

@immutable
abstract class CardsSearchingState extends Equatable {
  const CardsSearchingState();
}

class CardsSearchingInitial extends CardsSearchingState {
  @override
  List<Object> get props => [];
}

class CardSearchingLoaded extends CardsSearchingState {
  final List<YugiOhCard> data;
  const CardSearchingLoaded({
    required this.data,
  });
  @override
  List<Object> get props => [data];
}

class CardSearchingLoading extends CardsSearchingState {
  @override
  List<Object> get props => [];
}

class CardSearchingError extends CardsSearchingState {
  final String respone ;
  const CardSearchingError({
    required this.respone,
  });
  @override
  List<Object> get props => [respone];
}
