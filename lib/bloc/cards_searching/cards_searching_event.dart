part of 'cards_searching_bloc.dart';

@immutable
abstract class CardsSearchingEvent extends Equatable {
  const CardsSearchingEvent();
}

class CardSearchingStarted extends CardsSearchingEvent {
  @override
  List<Object> get props => [];
}

class CardSearchingIdSubmit extends CardsSearchingEvent {
  final List<dynamic> list;
  final String language;

  const CardSearchingIdSubmit(
    this.list,
    this.language,
  );

  @override
  List<Object?> get props => [list, language];
}

class CardRandomSubit extends CardsSearchingEvent {
  const CardRandomSubit();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CardSearchingSubmit extends CardsSearchingEvent {
  final String name;
  final String language;
  const CardSearchingSubmit({
    required this.name,
    required this.language,
  });
  @override
  List<Object> get props => [name, language];
}
