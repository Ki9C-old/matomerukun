import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:matomekun/model/apikey.dart';
import 'package:url_launcher/url_launcher.dart';

final getKeyUrl = Uri.parse('https://aistudio.google.com/app/apikey?hl=ja');

const whatIsApi = Text(
    'お使いのGoogleアカウントでGeminiProのAPIキーを取得し、以下に入力してください\n取得したAPIキーは自己責任で管理してください\nGeminiProモデルは原則無料で利用できます');

final howToGetKey = RichText(
  text: TextSpan(
    children: [
      const TextSpan(
        text: 'APIキーの取得は',
        style: TextStyle(color: Colors.black),
      ),
      TextSpan(
        text: 'こちら',
        style: const TextStyle(color: Colors.lightBlue),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            launchUrl(getKeyUrl);
          },
      ),
    ],
  ),
);

class ApiInsPage extends StatelessWidget {
  const ApiInsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final keySca = Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('まとめるくん'),
          backgroundColor: const Color.fromARGB(255, 92, 246, 233),
        ),
        body: Column(children: [
          SizedBox(
              height: 600,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                  child: Column(children: [
                    const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 40),
                        child: whatIsApi),
                    keyField,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                      child: howToGetKey,
                    ),
                    const KeyButton(),
                  ])))
        ]));
    return keySca;
  }
}

//apikey入力欄の設定
final keyController = TextEditingController();
var keyField = TextField(
  controller: keyController,
  decoration: const InputDecoration(
      border: OutlineInputBorder(), labelText: 'APIキーを入力'),
);

//ボタンの設定
class KeyButton extends StatelessWidget {
  const KeyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final keyButton = Container(
        margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: ElevatedButton(
          onPressed: () => keySubmit(context),
          child: const Text('確定'),
        ));
    return keyButton;
  }
}

//APIキー不正時の画面
class ApiError extends StatelessWidget {
  const ApiError({super.key});

  @override
  Widget build(BuildContext context) {
    final erorrSca = Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('まとめるくん'),
          backgroundColor: const Color.fromARGB(255, 92, 246, 233),
        ),
        body: Column(children: [
          SizedBox(
              height: 600,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                  child: Column(children: [
                    const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 40),
                        child: whatIsApi),
                    keyField,
                    const Text(
                      'APIキーが正しくありません',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                      child: howToGetKey,
                    ),
                    const KeyButton(),
                  ])))
        ]));
    return erorrSca;
  }
}
