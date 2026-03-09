

import 'dart:io';

import 'package:fruits_hub_dashboard/core/errors/exceptions.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service_images.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageServiceImages implements StorageServiceImages {
  final SupabaseClient client;

  SupabaseStorageServiceImages(this.client);

  @override
 Future<String> uploadFile(File file, String path) async {
  try {

    print("Uploading image to path: $path");

    await client.storage
        .from(EndPoients.imagesBucket)
        .upload(
          path,
          file,
          fileOptions: const FileOptions(upsert: true),
        );

    final imageUrl =
        client.storage.from(EndPoients.imagesBucket).getPublicUrl(path);
    return imageUrl;

  } catch (e) {
   
    throw CustomException(message: e.toString());
  }
}
  @override
  Future<void> deleteFile(String fileUrl) async {
    try {
      final uri = Uri.parse(fileUrl);

      final path = uri.pathSegments
          .skipWhile((segment) => segment != EndPoients.imagesBucket)
          .skip(1)
          .join('/');

      await client.storage
          .from(EndPoients.imagesBucket)
          .remove([path]);
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}