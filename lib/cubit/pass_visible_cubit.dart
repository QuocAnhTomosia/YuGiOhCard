import 'package:bloc/bloc.dart';

class PassVisibleCubit extends Cubit<bool> {
  PassVisibleCubit() : super(false);
  change() => emit(!state);
}
