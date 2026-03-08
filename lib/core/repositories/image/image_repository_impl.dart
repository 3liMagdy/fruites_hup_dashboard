import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../errors/exceptions.dart';
import '../../errors/failures.dart';
import '../../services/storage_service_images.dart';
import 'image_repository.dart';
import 'package:path/path.dart' as path;
import '../../utils/app_constant.dart';

class ImageRepositoryImpl implements ImageRepository {
  final StorageServiceImages storageService;

  ImageRepositoryImpl(this.storageService);

String _generateImagePath(File image) {
  final fileName = path.basename(image.path);
  final timestamp = DateTime.now().millisecondsSinceEpoch;

  return 'products/${timestamp}_$fileName';
}

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      final String downloadUrl = await storageService.uploadFile(image, _generateImagePath(image));
      return Right(downloadUrl);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteImage(String imageUrl) async {
    try {
      await storageService.deleteFile(imageUrl);
      return const Right(unit);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> replaceImage(File newImage, String oldImageUrl) async {
    try {
      try {
        await storageService.deleteFile(oldImageUrl);
      } catch (_) {
        // Ignored to ensure new upload continues even if delete fails
      }
      final String downloadUrl = await storageService.uploadFile(newImage, _generateImagePath(newImage));
      return Right(downloadUrl);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
