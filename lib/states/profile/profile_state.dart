import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileState with ChangeNotifier {
  ImagePicker get imagePicker => _imagePicker;
  XFile? get photo => _photo;

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _photo;

  Future<void> pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _photo = pickedFile;
      notifyListeners();
    }
  }
}
