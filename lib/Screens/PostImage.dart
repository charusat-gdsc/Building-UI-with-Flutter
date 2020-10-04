import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  bool _isUploading = false;

  double _uploadProgress = 0;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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

  uploadImage() async {
    try {
      if (_image != null) {
        setState(() {
          _isUploading = true;
          _uploadProgress = 0;
        });

        User user = _auth.currentUser;

        String fileName = DateTime.now().millisecondsSinceEpoch.toString() +
            path.basename(_image.path);

        final StorageReference storageReference =
            _storage.ref().child("posts").child(user.uid).child(fileName);

        final StorageUploadTask uploadTask = storageReference.putFile(_image);

        final StreamSubscription<StorageTaskEvent> streamSubscription =
            uploadTask.events.listen((event) {
          var totalBytes = event.snapshot.totalByteCount;
          var transferred = event.snapshot.bytesTransferred;

          double progress = ((transferred * 100) / totalBytes) / 100;
          setState(() {
            _uploadProgress = progress;
          });
        });

        StorageTaskSnapshot onComplete = await uploadTask.onComplete;

        String photoURL = await onComplete.ref.getDownloadURL();

        _db.collection('posts').add({
          "photoURL": photoURL,
          "name": user.displayName,
          "caption": _captionController.text,
          "date": DateTime.now(),
          "uploadedBy": user.uid
        });

        // when completed
        setState(() {
          _isUploading = false;
        });

        streamSubscription.cancel();
        Navigator.pop(this.context);
      } else {
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                content: Text("Please select image!"),
                title: Text("Alert"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              );
            });
      }
    } catch (e) {
      print(e);
    }
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
            _isUploading
                ? LinearProgressIndicator(
                    value: _uploadProgress,
                    backgroundColor: Colors.grey,
                  )
                : Container(),
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
                onPressed: () {
                  uploadImage();
                },
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
