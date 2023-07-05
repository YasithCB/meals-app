import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/Meal.dart';

class FavoriteMealsNotifire extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifire() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isMealFavorite = state.contains(meal);

    if (isMealFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifire, List<Meal>>(
  (ref) {
    return FavoriteMealsNotifire();
  },
);
