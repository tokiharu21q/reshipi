// main.dart
import 'package:flutter/material.dart';
import 'recipe.dart'; // ← Recipe クラスとレシピデータをここから読み込む

void main() {
  runApp(RecipeApp());
}

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
        itemCount: recipes.length, // ← recipe.dart から読み込んだデータを使う
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
                      fit: BoxFit.contain, // ← サイズを適切に合わせる
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
            Image.network(
              recipe.imageUrl,
              fit: BoxFit.contain, // ← ここも調整
            ),
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
