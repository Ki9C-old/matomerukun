import 'package:matomekun/controller/gemini.dart';
import 'package:matomekun/model/apikey.dart';
import 'package:matomekun/view/apiscreen.dart';
import 'package:matomekun/view/loadingscreen.dart';
import 'package:matomekun/view/responsescreen.dart';
import 'package:matomekun/view/urlscreen.dart';

final route = {
  'first': (context) => const MainMaterial(), //URL入力ページ
  'second': (context) => const NextPage(), //結果ページ
  'third': (context) => const ApiInsPage(), //APIキー登録ページ
  'fourth': (context) => const ApiError(), //APIキー登録ページ(error)
  'loading': (context) => const SimpleLoading(), //ローディング画面
};

//起動時画面判定
Future initialRoute() async {
  final String key = await selectApiKey();
  final bool errorFlg = await geminiCheck(key);
  String route;
  if (errorFlg == true) {
    route = 'third'; //gemini応答なし：nextRoute = APIキー登録画面
  } else {
    route = 'first'; //gemini応答あり：nextRoute = URL入力画面
  }
  print("ルート：$route");
  return route;
}
