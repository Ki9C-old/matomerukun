import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matomekun/controller/gemini.dart';

class MainMaterial extends ConsumerWidget {
  const MainMaterial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sca = PopScope(
        canPop: false,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('まとめるくん'),
              backgroundColor: const Color.fromARGB(255, 92, 246, 233),
              automaticallyImplyLeading: false,
            ),
            body: Padding(
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                child: Column(children: [field, const Button()]))));
    return sca;
  }
}

//ボタンの設定
class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    final button = Container(
        margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: ElevatedButton(
          onPressed: () => submit(context),
          child: const Text('確定'),
        ));
    return button;
  }
}

//URL入力欄の設定
final controller = TextEditingController();
var field = TextField(
  controller: controller,
  decoration: const InputDecoration(
      border: OutlineInputBorder(), labelText: 'まとめたいURLを入力'),
);
