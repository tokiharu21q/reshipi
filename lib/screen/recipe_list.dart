import 'package:flutter/material.dart';
import '../data/recipe_data.dart';
import 'recipe_detail.dart';

// ここでは実際のデータが格納されているrecipe_data.dartをimportしています。
// また、レシピ名をクリックした時にRecipeDetailクラスに遷移させなければならないので、
// recipe_detail.dartをimportしています。

class RecipeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('レシピ一覧')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: recipes.length,
        // ここでrecipesという変数を使えているのはrecipe_data.dartからimportしたためです。
        // lengthはrecipesの中にあるデータの数を返すメソッドです。
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return GestureDetector(
            // GestureDetectorはユーザーの操作を検知するウィジェットです。
            // 今回はonTapでタップした時の処理を記述しています。
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RecipeDetailPage(recipe: recipe),
                // RecipeDetailPageはrecipe_detail.dartで定義しているクラスです。
                //RecipeDetailPage()の（）の中には引数が入りますが、
                //recipeという引数が必須（required）であるとrecipe_detail.dartの方に定義されています。
                // 引数がない場合はエラーが出るので試してみてください。
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
                    child: Image.asset(
                    // child: Image.network(
                    // 画像をインターネットから取得する場合はImage.network()を使用します。
                    
                    // コラム：名前付きコンストラクタ
                    // 意味を理解する必要はありませんが、この"Image.asset()"までを名前付きコンストラクタと呼びます。
                    // Hiveをやった時に"box.put()"のような記述が出てきましたがこちらはメソッドと呼びます。
                    // 「記述の仕方が同じなのにどうして？！」という感じかもしれませんが、
                    // クラス名である（今回は"Image"）を選択して右クリックから「Go to definition」を選択すると
                    // そのクラスの大元の定義を確認することができます。
                    // クラスの中での書き方によって、
                    // "Image.assets()"が名前付きコンストラクタなのかメソッドなのか判別できます。
                    
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
