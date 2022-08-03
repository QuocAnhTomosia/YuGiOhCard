import 'dart:io';

import 'package:bloc/bloc.dart';

class ImageCubit extends Cubit<File> {
  ImageCubit() : super(File(""));
  addFile() => emit(state);
}
