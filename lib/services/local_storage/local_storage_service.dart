import 'package:eclipse_task/services/local_storage/local_storage_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService implements LocalStorageServiceInterface {
  static late final SharedPreferences _storage;

  static Future<void> init() async =>
      _storage = await SharedPreferences.getInstance();

  @override
  String? getString(String key) {
    return _storage.getString(key);
  }

  @override
  Future<void> setString({required String key, required String value}) async {
    await _storage.setString(key, value);
  }
}
