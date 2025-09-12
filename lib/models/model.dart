class Recipe {
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;

  // ここまではRecipeというクラスが「どんな型の」「何という名前の」変数を持っているか？を設計しています。
  // 例）final String title; ...String="文字列"のデータ型。title=変数名。ユーザーが自由に設定できます。

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  });

  //　Recipeクラスの中に早速Recipeが登場しました。
  // 入れ子になっているのが厄介ですが、新しいレシピを複製する（複製＝インスタンス）時のルールを書いてると思ってください。
  // required をつけることで、新しいレシピを複製する（複製＝インスタンス）時に必ず必要な項目を指定しています。
  // 新しいレシピを作る時には必ず「名前（title）、画像（imageUrl）、材料（ingredients）、手順（steps）」を書いてね、 ということです。
  // Amazonの商品なんかにたまにありますが、例えば「Item（商品）」というクラスがあったとして、
  // 「別に画像は必須じゃないよ～」という仕様にしたい場合はrequired を外すだけで大丈夫です。
}
