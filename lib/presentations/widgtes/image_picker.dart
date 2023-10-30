import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentlogin/utils/constants.dart/colors.dart';

class ImagePickerButton extends StatefulWidget {
  const ImagePickerButton({super.key});

  @override
  ImagePickerButtonState createState() => ImagePickerButtonState();
}

class ImagePickerButtonState extends State<ImagePickerButton> {
  PickedFile? pickedImage;
  String? imageName;

  Future<void> picksImage() async {
    final picker = ImagePicker();
    final pickTheImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickTheImage != null) {
      setState(() {
        pickedImage = PickedFile(pickTheImage.path);
        imageName = p.basename(pickedImage!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Color.fromARGB(255, 249, 220, 254),
          )),
          onPressed: picksImage,
          child: const Text(
            'Pick an Image',
            style: TextStyle(
              color: tBlackColor,
            ),
          ),
        ),
        if (pickedImage != null)
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.file(
                  File(pickedImage!.path),
                ),
              ),
              Expanded(
                child: Text(
                  '$imageName',
                ),
              ),
            ],
          ),
      ],
    );
  }
}
