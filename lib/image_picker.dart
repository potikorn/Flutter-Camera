import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    print("Image Uri is ${image.uri}");
    print("Image Path is ${image.path}");
    print("Image Parent is ${image.parent}");
    print("Image Absolute is ${image.absolute}");
    print("Image Is Absolute is ${image.isAbsolute}");
    print("Image Runtime type is ${image.runtimeType}");
    setState(() {
      _image = image;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print("Image Uri is ${image.uri}");
    print("Image Path is ${image.path}");
    print("Image Parent is ${image.parent}");
    print("Image Absolute is ${image.absolute}");
    print("Image Is Absolute is ${image.isAbsolute}");
    print("Image Runtime type is ${image.runtimeType}");
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null ? chooseFromGalleryView() : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget chooseFromGalleryView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('No image selected.'),
        RaisedButton(
          onPressed: getImageFromGallery,
          child: Text('Choose From Gallery'),
        )
      ],
    );
  }
}
