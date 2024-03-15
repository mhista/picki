import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pickafrika/features/shop/models/product_category_model.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductCategoryRepository extends GetxController {
  static ProductCategoryRepository get instance => Get.find();

  // VARIABLES
  final _db = FirebaseFirestore.instance;

  // GET ALL BRANDS FOR CATEGORY
  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = 4}) async {
    try {
      // query to get all documents where product id matches provided categoryId
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();
      // return the brandIds from the documents
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();

      // Query to get all products  where the brandIds is in the list. FieldPath.documentId to query documents in collection
      final productQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Extract brand names or other relevant data from the document
      List<ProductModel> products = productQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }
// GET SUB BRANDS

//  UPLOAD PRODUCTCATEGORY TO THE CLOUD FIRESTORE
  Future<void> createProductCategory(
      List<ProductCategoryModel> productCategoryModel) async {
    try {
      // STORE BRAND IN FIRESTORE
      for (var productCategory in productCategoryModel) {
        await _db
            .collection('ProductCategory')
            .doc()
            .set(productCategory.toMap());
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
