import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pickafrika/data/services/firebase_services/firebase_storage_services.dart';
import 'package:pickafrika/features/shop/models/brand_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  // VARIABLES
  final _db = FirebaseFirestore.instance;

// GET ALL BRANDS
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final list =
          snapshot.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }

// GET SUB BRANDS

// UPLOAD BRANDS TO THE CLOUD FIRESTORE
  Future<void> uploadData(List<BrandModel> brands) async {
    try {
      // UPLOAD ALL BRANDS ALONG WITH THEIR IMAGES
      final storage = Get.put(PFirebaseStorageServices());
      // LOOP THROUGH EACH Brand
      for (var brand in brands) {
        // GET IMAGEDATA LINK FROM THE LOCAL ASSETS;
        final file = await storage.getImageDataFromAssets(brand.image);

        // upload image and get its url
        final url = await storage.uploadImageData('Brands', file, brand.name);
        // Assign url to Brand.image attribute
        brand.image = url;

        // STORE BRAND IN FIRESTORE
        await _db.collection('Brands').doc(brand.id).set(brand.toMap());
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
