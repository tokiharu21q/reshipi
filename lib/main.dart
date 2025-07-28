import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

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

final List<Recipe> recipes = [
  Recipe(
    title: 'トンテキ',
    imageUrl:
        'https://cdn.pixabay.com/photo/2022/04/05/20/58/meat-7113156_1280.jpg',
    ingredients: ['豚肉', 'にんにく', 'ソース'],
    steps: ['豚肉を焼く', 'ソースをかける', '盛り付けて完成'],
  ),
  Recipe(
    title: '照り焼きチキン',
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/03/05/20/07/teriyaki-chicken-1239006_1280.jpg',
    ingredients: ['鶏もも肉', 'しょうゆ', 'みりん', '砂糖'],
    steps: ['タレを作る', '鶏肉を焼く', 'タレを絡める'],
  ),
];

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'レシピアプリ',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: RecipeListPage(),
    );
  }
}

class RecipeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('レシピ一覧')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RecipeDetailPage(recipe: recipe),
              ),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      recipe.imageUrl,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      recipe.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium ??
        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Image.network(recipe.imageUrl),
            const SizedBox(height: 16),
            Text('材料', style: textStyle),
            ...recipe.ingredients.map((item) => Text('・$item')).toList(),
            const SizedBox(height: 16),
            Text('作り方', style: textStyle),
            ...recipe.steps.asMap().entries.map(
                  (entry) => Text('${entry.key + 1}. ${entry.value}'),
                ),
          ],
        ),
      ),
    );
  }
}
