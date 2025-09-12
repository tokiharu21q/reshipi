import 'package:flutter/material.dart';
import 'screen/recipe_list.dart';

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

// main.dart
// main.dartは極力シンプルにしました。
// あくまでアプリが起動するエントリーポイント、ということだけが分かればいいかなと思います。
// 17行目のhome: RecipeListPage()はRecipeListPageが一番最初に表示されるホーム画面になります。
// RecipeListPageというクラスはmain.dartで定義していないため、
// recipe_list.dartからimportすることで使えるようになります。
// 2行目をコメントアウトすると17行目に赤線のリンターエラーが出ると思うので試してみてください。