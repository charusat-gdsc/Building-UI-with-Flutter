import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PostImageScreen extends StatefulWidget {
  @override
  _PostImageScreenState createState() => _PostImageScreenState();
}

class _PostImageScreenState extends State<PostImageScreen> {
  File _image;
  final picker = ImagePicker();
  TextEditingController _captionController = TextEditingController();

  captureFromCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    cropImage(image);
  }

  uploadFromStorage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    cropImage(image);
  }

  cropImage(var image) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path, compressQuality: 40);
    setState(() {
      _image = croppedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post an image'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {
              captureFromCamera();
            },
            tooltip: 'Capture from Camera',
          ),
          IconButton(
            icon: Icon(Icons.add_photo_alternate),
            onPressed: () {
              uploadFromStorage();
            },
            tooltip: 'Upload from storage',
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _image != null
                ? Image.file(_image)
                : Image(
                    image: AssetImage('assets/placeholder.png'),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: TextField(
                controller: _captionController,
                decoration: InputDecoration(hintText: 'Enter Caption Here'),
              ),
            ),
            Container(
              height: 50,
              width: 175,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: RaisedButton(
                onPressed: () {},
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                splashColor: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Upload',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
