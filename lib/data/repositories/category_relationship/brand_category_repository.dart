import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pickafrika/features/shop/models/brand_category_model.dart';
import 'package:pickafrika/features/shop/models/brand_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandCategoryRepository extends GetxController {
  static BrandCategoryRepository get instance => Get.find();

  // VARIABLES
  final _db = FirebaseFirestore.instance;

  // GET ALL BRANDS FOR CATEGORY
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // query to get all documents where category id matches provided categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      debugPrint(brandCategoryQuery.toString());

      // return the brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();
      debugPrint(brandIds.toString());

      // Query to get all brands  where the brandIds is in the list. FieldPath.documentId to query documents in collection
      final brandQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(3)
          .get();

      // Extract brand names or other relevant data from the document
      List<BrandModel> brands =
          brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      debugPrint(brands.toString());

      return brands;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }
// GET SUB BRANDS

//  UPLOAD BRANDS TO THE CLOUD FIRESTORE
  Future<void> createBrandCategory(
      List<BrandCategoryModel> brandCategoryModel) async {
    try {
      // STORE BRAND IN FIRESTORE
      for (var brandCategory in brandCategoryModel) {
        await _db.collection('BrandCategory').doc().set(brandCategory.toMap());
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
