part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

class LogInChangeInfo extends LogInEvent {
  final String field;
  final dynamic data;
  const LogInChangeInfo({
    required this.field,
    required this.data,
  });
  @override
  List<Object> get props => [field,data];
}

class LogInReset extends LogInEvent {
  const LogInReset();
  @override
  List<Object> get props => [];
}

class LogInSubmit extends LogInEvent {
  final String email;
  final String password;
  const LogInSubmit({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}
