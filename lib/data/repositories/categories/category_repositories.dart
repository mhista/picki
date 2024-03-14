import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pickafrika/data/services/firebase_services/firebase_storage_services.dart';
import 'package:pickafrika/features/shop/models/category_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // VARIABLES
  final _db = FirebaseFirestore.instance;

// GET ALL CATEGORIES
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list =
          snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }
// GET SUB CATEGORIES

// UPLOAD CATEGORIES TO THE CLOUD FIRESTORE
  Future<void> uploadDummeyData(List<CategoryModel> categories) async {
    try {
      // UPLOAD ALL CATEGORIES ALONG WITH THEIR IMAGES
      final storage = Get.put(PFirebaseStorageServices());
      // LOOP THROUGH EACH CATEGORY
      for (var category in categories) {
        // GET IMAGEDATA LINK FROM THE LOCAL ASSETS;
        final file = await storage.getImageDataFromAssets(category.image);

        // upload image and get its url
        final url =
            await storage.uploadImageData('Categories', file, category.name);
        // Assign url to category.image attribute
        category.image = url;

        // STORE CATEGORY IN FIRESTORE
        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toMap());
      }
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }
}
