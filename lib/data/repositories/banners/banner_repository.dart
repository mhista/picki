import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pickafrika/data/services/firebase_services/firebase_storage_services.dart';
import 'package:pickafrika/features/shop/models/banner_model.dart';
import 'package:pickafrika/features/shop/models/category_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // VARIABLES
  final _db = FirebaseFirestore.instance;

// GET ALL BANNERS
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final snapshot = await _db
          .collection('Banners')
          .where('active', isEqualTo: true)
          .get();
      final list =
          snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
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

// UPLOAD BANNERS TO THE CLOUD FIRESTORE
  Future<void> uploadDummeyData(List<BannerModel> banners) async {
    try {
      // UPLOAD ALL CATEGORIES ALONG WITH THEIR IMAGES
      final storage = Get.put(PFirebaseStorageServices());
      // LOOP THROUGH EACH CATEGORY
      for (var banner in banners) {
        // GET IMAGEDATA LINK FROM THE LOCAL ASSETS;
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // upload image and get its url
        final url =
            await storage.uploadImageData('Banners', file, banner.imageUrl);
        // Assign url to banner.image attribute
        banner.imageUrl = url;

        // STORE banner IN FIRESTORE
        await _db.collection('Banners').doc().set(banner.toMap());
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
