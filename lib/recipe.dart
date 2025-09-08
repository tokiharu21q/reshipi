import 'package:flutter/material.dart';

void main() {
  runApp(MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyRecipe',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: RecipeListScreen(),
    );
  }
}

class Recipe {
  final String title;
  final String imageUrl;

  Recipe({required this.title, required this.imageUrl});
}

// 仮のレシピデータ
final List<Recipe> recipes = [
  Recipe(title: 'トンテキ', imageUrl: 'https://picsum.photos/200/150?1'),
  Recipe(title: 'カレーライス', imageUrl: 'https://picsum.photos/200/150?2'),
  Recipe(title: 'オムライス', imageUrl: 'https://picsum.photos/200/150?3'),
  Recipe(title: '味噌汁', imageUrl: 'https://picsum.photos/200/150?4'),
  Recipe(title: 'ハンバーグ', imageUrl: 'https://picsum.photos/200/150?5'),
];

class RecipeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('レシピ一覧'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  recipe.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                recipe.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // ここで詳細画面に遷移予定
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${recipe.title} を選択しました')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
