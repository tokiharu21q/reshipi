import '../models/model.dart';

// model.dartからRecipeクラスをimportしています。
// model.dartではRecipeクラスというすべてのレシピのもととなる設計図を作りましたね。

final List<Recipe> recipes = [
  Recipe(
    title: 'トンテキ',
    imageUrl:'assets/images/tonteki.png',
    ingredients: ['豚肉', 'にんにく', 'ソース'],
    steps: ['豚肉を焼く', 'ソースをかける', '盛り付けて完成'],
  ),
  Recipe(
    title: '照り焼きチキン',
    imageUrl:'assets/images/teriyaki_chicken.png',
    ingredients: ['鶏もも肉', 'しょうゆ', 'みりん', '砂糖'],
    steps: ['タレを作る', '鶏肉を焼く', 'タレを絡める'],
  ),
];

// 7行目は若干ややこしいですが、recipesが変数名です。
// そしてそのデータ型はList<Recipe>です。
// List型でなければならない上にListの中身がRecipe型でなければならない、ということです。
//　このように、型に設定できるのはListやString、intなどの基本データ型だけではなく、
// 自分で作成したクラス（今回はRecipeクラス）も設定できることを示しています。
// これによって、recipes変数にはRecipe型のデータが複数入っていることを示しています。
// 試しに19行目の","と20行目の];の間に適当な数字や文字のみを入力して、エラーの内容を確認してください。
// また、Recipe（）のなかのいずれかの項目をコメントアウトして、エラーの内容を確認してみてください。