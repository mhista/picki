import 'package:get_storage/get_storage.dart';

class PLocalStorage {
  // static  PLocalStorage _instance = PLocalStorage._internal();
  // SINGLETON INSTANCE
  static PLocalStorage? _instance;

  factory PLocalStorage.instance() {
    _instance ??= PLocalStorage._internal();
    return _instance!;
  }

  PLocalStorage._internal();

  late final GetStorage _storage;

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = PLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

// generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

// generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

// clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}

//

// void work() {
//   PLocalStorage localStorage = PLocalStorage._instance;

// // SAVE DATA
//   localStorage.saveData('UserName', 'JohnDoe');

//   // READ DATA
//   localStorage.readData('UserName');

//   // REMOVE DATA
//   localStorage.removeData('UserName');

// // CLEAR ALL
//   localStorage.clearAll();
// }
