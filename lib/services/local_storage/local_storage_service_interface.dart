abstract class LocalStorageServiceInterface{
  Future<void> setString({required String key, required String value});
  String? getString(String key);
}