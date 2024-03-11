import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pickafrika/data/services/firebase_services/firebase_storage_services.dart';
import 'package:pickafrika/features/shop/controllers/product/image_controller.dart';
import 'package:pickafrika/features/shop/models/category_model.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_eceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // VARIABLES
  final _db = FirebaseFirestore.instance;

// GET ALL PRODUCTS
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();
      final list =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }

  // / GET ALL FEATURED PRODUCTS
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();
      debugPrint(snapshot.toString());
      final list =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }
// GET SUB Products

// UPLOAD Products TO THE CLOUD FIRESTORE
  Future<void> uploadDummeyData(List<ProductModel> products) async {
    try {
      // UPLOAD ALL Products ALONG WITH THEIR IMAGES
      final storage = Get.put(PFirebaseStorageServices());
      // LOOP THROUGH EACH product
      final imageController = Get.put(ImageController());

      for (var product in products) {
        final productToUpload =
            await imageController.uploadProductImages(product, storage);
        // STORE product IN FIRESTORE
        await _db
            .collection('Products')
            .doc(productToUpload.id)
            .set(productToUpload.toMap());
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
