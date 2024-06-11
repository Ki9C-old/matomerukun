//確定ボタン押下後の画面
import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final summary = args['summary'] as String; // 型安全にキャスト

    final sca_2 = PopScope(
        canPop: false,
        child: Scaffold(
            appBar: AppBar(
                title: const Text('まとめるくん'),
                backgroundColor: const Color.fromARGB(255, 92, 246, 233),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    'first',
                  ),
                )),
            body: SingleChildScrollView(
                // 追加
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                child: Column(children: [Text(summary)]))));
    return sca_2;
  }
}
