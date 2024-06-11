// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:matomekun/model/apikey.dart';
import 'package:matomekun/view/urlscreen.dart';

//確定ボタン押下時の処理

submit(BuildContext context) async {
  if (controller.text != "") {
    Navigator.pushNamed(
      context,
      'loading',
    );
    try {
      final prompt = makeprompt();
      final summary = await gemini(prompt);
      Navigator.pushNamed(
        context,
        'second',
        arguments: {'summary': summary},
      );
    } catch (error) {
      // エラー処理
      print(error as String?); // コンソールに出力
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('エラーが発生しました: ${error.toString()}'),
        ),
      );
    }
  }
}

//Geminiに送信するプロンプトの作成
makeprompt() {
  final prompt = '${controller.text}\nこのページの内容を要約してください。';
  return prompt;
}

//Geminiとやり取りするためのあれこれ、Geminiからの答えをresponseに格納
Future gemini(String text) async {
  // ignore: constant_identifier_names, non_constant_identifier_names
  final API_KEY = await selectApiKey();
  final model = GenerativeModel(model: 'gemini-pro', apiKey: API_KEY);
  final content = [Content.text(text)];
  final response = await model.generateContent(content);
  return response.text;
}

Future<bool> geminiCheck(String key) async {
  bool errorFlg;
  try {
    final model = GenerativeModel(model: 'gemini-pro', apiKey: key);
    final content = [Content.text('こんにちは')];
    final responce = await model.generateContent(content);
    errorFlg = false;
    if (responce.text == '') {
      errorFlg = true;
    }
  } catch (e) {
    errorFlg = true;
  }
  print(errorFlg);
  return errorFlg;
}
