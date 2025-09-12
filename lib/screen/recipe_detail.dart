import 'package:flutter/material.dart';
import '../models/model.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailPage({required this.recipe});
  // レシピ詳細画面でもRecepiクラスのデータを取得するためmodel.dartからRecipeクラスをimportしています。

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium ??
        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    // "??"という記号はnull合体演算子という演算子です。
    // "??"の左側にある値(final textStyle)がnull（空）でない場合は左側にある値をそのまま使い、
    // null（空）の場合は右側にある値を使います。この場合は左側の値がそのまま使われているようです。
    // 特にこの処理にこだわらず、自分でテキストの装飾をしたい場合は必要ない処理かもしれませんが、
    // せっかくなので残しておきましょう。

    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Image.asset(recipe.imageUrl),
            const SizedBox(height: 16),
            Text('材料', style: textStyle),
            // recipe.ingredients.map((item) => Text('・$item')).toList(),
            ...recipe.ingredients.map((item) => Text('・$item')),
            // この1文で重要なのはmapメソッドです。
            // mapメソッドはList型のデータに対して指定した処理を繰り返し実行してくれます。
            // 今回の場合はrecipe.ingredientsというList型のデータがあります。
            // 実際のデータの中身は['豚肉', 'にんにく', 'ソース']です。
            // まず'豚肉'という文字列を取り出して、1つ目の(item)に代入します。
            // それがそのままText('・$item')に代入されるので、Text('・豚肉')というウィジェットが作成されます。

            // そしてもう1つ重要なのがスプレッド演算子である「...」です。
            // この記述ともともと存在していたtoList()は役割が重複しているため削除しました。
            // 現在recipe.ingredientsというList型のデータには以下のようなデータが入っています。
            // 「Text('・豚肉'), Text('・にんにく'), Text('・ソース')」
            // これが24行目のchildrenという名前のListに入っています。
            // そのためList型の中にList型のデータがあって型が合わないのです。
            // 試しに以下の例のコメントを外してみてください。
            
            // エラーが出る例
            // [],

            // エラーが出ない例
            // ...[],

            // このようにスプレッド演算子はList型のデータの中身が空でも展開して並べる機能を持っています。
            // 分解といってもいいかもしれませんね。
            
            // ■コラム
            // ''は文字列として扱うための記号、$は後続の文字列を変数として扱うために必要な記号です。
            // $を外してしまうとすべての文字列が「・item」になってしまうと思います。
            // (item) => というのはitemという引数を持った名前のないアロー関数というものです。
            // 名前があるとSet（item） =>　とかになります。
            // 名前のない関数は使いまわす必要がない、その場限りの処理をする場合に頻繁に利用されます。
            
            const SizedBox(height: 16),
            Text('作り方', style: textStyle),
            ...recipe.steps.asMap().entries.map((entry) => Text('${entry.key + 1}. ${entry.value}')),
            // 考え方は上記と途中まで似ていますが、ここで重要なのはasMap()というメソッドです。
            // データ型の一種にmap型というものがあります。
            // ここでは実際の['豚肉を焼く', 'にんにくを炒める', 'ソースを加える']というデータが
            // {0: '豚肉を焼く', 1: 'にんにくを炒める', 2: 'ソースを加える'}というデータに変換されています。
            // 数字の部分をkeyといい、keyとペアになっている:の後ろにあるデータをvalueといいます。
            // そしてentriesというメソッドがありますがこれはなぜ必要なのでしょうか。
            // 答えはmapメソッドはmap型のデータに対して使用できないためです。
            // あくまでList型のデータに対してしか使用できません。
            // そのため、entriesというメソッドを使ってList型のデータに変換しています。
            // 変換すると[0: '豚肉を焼く', 1: 'にんにくを炒める', 2: 'ソースを加える']というデータに変換されます。
            // こうすることで「0:'豚肉を焼く」というデータが(entry) => に代入される仕組みになっています。
          ],
        ),
      ),
    );
  }
}
