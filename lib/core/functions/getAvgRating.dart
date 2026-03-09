

import 'package:fruits_hub_dashboard/core/models/review_model.dart';

num getAvgRating(List<ReviewModel> reviews) {
  if (reviews.isEmpty) return 0;

  num total = 0;
  for (var review in reviews) {
    total += review.ratting;
  }

  return total / reviews.length;
}