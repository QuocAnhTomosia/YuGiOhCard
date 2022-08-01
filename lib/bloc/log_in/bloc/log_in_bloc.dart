import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yugi_oh_cards/bloc/log_in/bloc/log_in_state.dart';
import 'package:yugi_oh_cards/services/firebase_auth_service.dart';
import 'package:yugi_oh_cards/services/firebase_firestore_service.dart';

part 'log_in_event.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(const LogInState.initState()) {
    on<LogInEvent>((event, emit) {});
    on<LogInSubmit>(_onSubmit);
    on<LogInChangeInfo>(_onChangeInfo);
    on<LogInReset>(
      (event, emit) {
        emit(const LogInState(message: "", status: LogInStatus.init));
      },
    );
  }

  Future<void> _onSubmit(LogInSubmit event, Emitter emit) async {
    try {
      String result =
          await FirebaseAuthService().emailSignIn(event.email, event.password);
      if (result != "some error happend") {
        FireStoreService().getUserByUid(result);
        emit(LogInState(message: result, status: LogInStatus.success));
      } else {
        emit(const LogInState(
            message: "some error happend", status: LogInStatus.error));
      }
    } catch (e) {
      emit(LogInState(message: e.toString(), status: LogInStatus.error));
    }
  }

  FutureOr<void> _onChangeInfo(
      LogInChangeInfo event, Emitter<LogInState> emit) {
    if (state.status == LogInStatus.success) {
      FireStoreService().updateInfo(state.message!, event.field, event.data);
    }
  }
}