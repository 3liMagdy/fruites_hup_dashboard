// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'storage_service_Products.dart';

// class FirestoreServiceProducts implements StorageServiceProducts {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Future<void> addData(String collectionPath, Map<String, dynamic> data) async {
//     await _firestore.collection(collectionPath).add(data);
//   }

//   @override
//   Future<void> updateData(String documentPath, Map<String, dynamic> data) async {
//     await _firestore.doc(documentPath).update(data);
//   }

//   @override
//   Future<void> deleteData(String documentPath) async {
//     await _firestore.doc(documentPath).delete();
//   }

//   @override
//   Future<List<Map<String, dynamic>>> getCollection(String collectionPath) async {
//     final snapshot = await _firestore.collection(collectionPath).get();
//     return snapshot.docs.map((doc) => doc.data()).toList();
//   }
// }
