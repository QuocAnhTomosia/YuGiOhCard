import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yugi_oh_cards/services/firebase_firestore_service.dart';

part 'user_sign_up_event.dart';
part 'user_sign_up_state.dart';

class UserSignUpBloc extends Bloc<UserSignUpEvent, UserSignUpState> {
  UserSignUpBloc() : super(UserSignUpInitial()) {
    on<UserSignUpEvent>((event, emit) {});
    on<UserSignUpStart>((event, emit) {
      emit(UserSignUpInitial());
    });
    on<UserSignUpSubmit>((event, emit) async {
      if (state != UserSignUpSubmitting) {
        emit(const UserSignUpSubmitting());
      }
      try {
        String img =
            await FireStoreService().uploadImage(File(event.image.path));
        String status = await FireStoreService().addNewUser(
            event.name, event.email, event.password,img, event.phoneNumber);
        if(status == "Success")
        {
          emit(const UserSignUpSubmitted());
        }
        else
        {
          emit(UserSignUpError(error: status));
        }
      } catch (e) {
        emit(UserSignUpError(error: e.toString()));
      }
    });
  }
}
