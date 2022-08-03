import 'package:equatable/equatable.dart';
import 'package:yugi_oh_cards/commons/constant.dart';
import 'package:yugi_oh_cards/models/user_model.dart';

enum LogInStatus { init, error, success }

class LogInState extends Equatable {
  final LogInStatus? status;
  final String? message;
  final MyUser? myUser;
  const LogInState({
    this.status,
    this.message,
    this.myUser,
  });
  LogInState.initState()
      : this(
            message: "init",
            status: LogInStatus.init,
            myUser: Constant().errorUser);
  LogInState copyWith({
    String? message,
    LogInStatus? logInStatus,
  }) {
    return LogInState(
      message: message,
      status: logInStatus,
    );
  }

  LogInState.error(String mess)
      : this(
            message: mess,
            status: LogInStatus.error,
            myUser: Constant().errorUser);
  const LogInState.success(String uid, MyUser myUser)
      : this(message: uid, myUser: myUser, status: LogInStatus.success);

  @override
  List<Object?> get props => [message, status,myUser];
}
