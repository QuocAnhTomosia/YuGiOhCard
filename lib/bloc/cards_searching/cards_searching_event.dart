part of 'cards_searching_bloc.dart';

@immutable
abstract class CardsSearchingEvent extends Equatable {
  const CardsSearchingEvent();
}

class CardSearchingStarted extends CardsSearchingEvent {
  @override
  List<Object> get props => [];
}

class CardSearchingSubmit extends CardsSearchingEvent {
  final String name;
  final String language;
  const CardSearchingSubmit({
    required this.name,
    required this.language,
  });
  @override
  List<Object> get props => [name,language];
}
