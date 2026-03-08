
import 'package:fruits_hub_dashboard/core/utils/app_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'storage_service_Products.dart';

class SupabaseServiceProducts implements StorageServiceProducts {

  final SupabaseClient client;

  SupabaseServiceProducts(this.client);

  @override
  Future<void> addData(String table, Map<String, dynamic> data) async {
    await client
        .from(table)
        .insert(data);
  }

  @override
  Future<void> updateData(String documentId, Map<String, dynamic> data) async {
    await client
        .from(EndPoients.productsTable)
        .update(data)
        .eq('id', documentId);
  }

  @override
  Future<void> deleteData(String documentId) async {
    await client
        .from(EndPoients.productsTable)
        .delete()
        .eq('id', documentId);
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection(String table) async {

    final response = await client
        .from(table)
        .select();

    return List<Map<String, dynamic>>.from(response);
  }
}