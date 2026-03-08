import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';

abstract class ImageRepository {
  Future<Either<Failure, String>> uploadImage(File image);
  Future<Either<Failure, Unit>> deleteImage(String imageUrl);
  Future<Either<Failure, String>> replaceImage(File newImage, String oldImageUrl);
}
