// Helper function for cloud related functionalities
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../exceptions/firebase_exceptions.dart';
import '../exceptions/platform_exceptions.dart';

class KCloudHelperFunction {
// helper function to check teh state of a single record
//
// returns a widget based on the state of a snapshot
// if data is still loading, it returns a CircularProgressIndicator
// if no data is found, it returns a geeric 'No Data FOUNd' message
// if aan error occurs, it returns a generic error message
// otherwise, it returns null

  static Widget? checkSingleRecordState<T>(AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text('No Data Found!'),
      );
    }
    if (snapshot.hasError) {
      return const Center(
        child: Text('Something went wrong'),
      );
    }
    return null;
  }

// helper function to check teh state of a multi record
//
// returns a widget based on the state of a snapshot
// if data is still loading, it returns a loadere widget or CircularProgressIndicator
// if no data is found, it returns a noDataFound widget or a generic 'No Data FOUNd' message
// if aan error occurs, it returns a generic error message
// otherwise, it returns null
  static Widget? checkMultiRecordState<T>({
    required AsyncSnapshot<List<T>> snapshot,
    Widget? loader,
    Widget? noDataFound,
    Widget? error,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const CircularProgressIndicator.adaptive();
    }
    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (noDataFound != null) return noDataFound;

      return const Center(
        child: Text('No Data Found!'),
      );
    }
    if (snapshot.hasError) {
      if (error != null) return error;

      return const Center(
        child: Text('Something went wrong'),
      );
    }
    return null;
  }

// Create a refernce with an initial file path and name and retrieve the download URL
  static Future<String> getUrlFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
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
