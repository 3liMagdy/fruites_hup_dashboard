abstract class StorageServiceProducts {
  Future<void> addData(String collectionPath, Map<String, dynamic> data);
  Future<void> updateData(String documentPath, Map<String, dynamic> data);
  Future<void> deleteData(String documentPath);
  Future<List<Map<String, dynamic>>> getCollection(String collectionPath);
}
