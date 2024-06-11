// ignore_for_file: use_build_context_synchronously

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:matomekun/controller/gemini.dart';
import 'package:matomekun/view/apiscreen.dart';

const boxName = "apiKeyBox";

Future<String> selectApiKey() async {
  await Hive.initFlutter();
  await Hive.openBox(boxName);
  var box = Hive.box(boxName);
  String val = box.get("API_KEY", defaultValue: 'null');
  print('APIKEY:$val');
  return val;
}

Future<void> insertApiKey(apikey) async {
  await Hive.openBox(boxName);
  var box = Hive.box(boxName);
  box.put("API_KEY", apikey);
}

Future keySubmit(BuildContext context) async {
  Navigator.pushNamed(
    context,
    'loading',
  );
  final errorFlg = await geminiCheck(keyController.text);
  if (errorFlg == false) {
    //gemini応答あり
    try {
      await insertApiKey(keyController.text); //APIKEYの保存
      await Navigator.pushNamed(context, 'first'); //nextRoute = URL入力画面
    } catch (error) {
      // エラー処理
      print(error as String?); // コンソールに出力
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('エラーが発生しました: ${error.toString()}'),
        ),
      );
    }
  } else {
    //Gemini応答なし
    await Navigator.pushNamed(context, 'fourth');
  }
}
