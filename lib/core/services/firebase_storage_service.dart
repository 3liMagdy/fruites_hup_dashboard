import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../errors/exceptions.dart';
import 'storage_service.dart';

class FirebaseStorageService implements StorageService {
  final FirebaseStorage storage;

  FirebaseStorageService(this.storage);

  @override
  Future<String> uploadFile(File file, String path) async {
    try {
      final ref = storage.ref().child(path);
      await ref.putFile(file);
      return await ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message ?? "Storage error");
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<void> deleteFile(String fileUrl) async {
    try {
      final ref = storage.refFromURL(fileUrl);
      await ref.delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message ?? "Storage error");
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
