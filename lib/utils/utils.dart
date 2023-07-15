import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage({ required ImageSource imageSource}) async {
  final ImagePicker _image = ImagePicker();

  XFile? _file = await _image.pickImage(source: imageSource);

  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('no image selected');
}

customSnackBar({
  required BuildContext context,
  required String content,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
