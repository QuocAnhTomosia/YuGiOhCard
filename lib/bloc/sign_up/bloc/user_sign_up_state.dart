part of 'user_sign_up_bloc.dart';

abstract class UserSignUpState extends Equatable {
  const UserSignUpState();

  @override
  List<Object> get props => [];
}

class UserSignUpInitial extends UserSignUpState {}

class UserSignUpSubmitting extends UserSignUpState {
  const UserSignUpSubmitting();

  @override
  List<Object> get props => [];
}

class UserSignUpSubmitted extends UserSignUpState {
  const UserSignUpSubmitted();
  @override
  List<Object> get props => [];
}

class UserSignUpError extends UserSignUpState {
  final String error;
  const UserSignUpError({
    required this.error,
  });
  
   @override
  List<Object> get props => [error];
}
