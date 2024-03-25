import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class PFirebaseStorageServices extends GetxController {
  static PFirebaseStorageServices get instance => Get.find();

  // VARIABLES
  final _firebaseStorage = FirebaseStorage.instance;

  // UPLOAD LOCAL ASSETS FROM IDE
  // RETURNS A UNIT8LIST CONTAINING IMAGE DATA
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      // debugPrint(path);

      final byteData = await rootBundle.load(path);
      debugPrint(byteData.toString());

      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      debugPrint(path);

      return imageData;
    } catch (e) {
      throw 'Error loading image data: $e';
    }
  }

  // UPLOAD IMAGE USING IMAGEDATA ON CLOUD FIREBASE STORAGE
  // RETURNS THE DOWNLOAD URL OF THE UPLOADED IMAGE
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Socket Exception: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something went wrong! please try again';
      }
    }
  }

  // UPLOAD IMAGE ON CLOUD FIREBASE STORAGE
  // RETURNS THE DOWNLOAD URL OF THE UPLOADED IMAGE
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }
}
