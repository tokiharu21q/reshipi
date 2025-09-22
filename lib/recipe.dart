// lib/recipe.dart

class Recipe {
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  });
}

// 仮のレシピデータ
final List<Recipe> recipes = [
  Recipe(
    title: 'トンテキ',
    imageUrl: 'https://picsum.photos/200/150?1',
    ingredients: ['豚肉', 'にんにく', 'ソース'],
    steps: ['豚肉を焼く', 'ソースをかける', '盛り付けて完成'],
  ),
  Recipe(
    title: '照り焼きチキン',
    imageUrl: 'https://picsum.photos/200/150?2',
    ingredients: ['鶏もも肉', 'しょうゆ', 'みりん', '砂糖'],
    steps: ['タレを作る', '鶏肉を焼く', 'タレを絡める'],
  ),
];
