import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matomekun/controller/route.dart';
import 'package:matomekun/view/urlscreen.dart';

main() async {
  final initRoute = await initialRoute();
  final app = MaterialApp(
      initialRoute: initRoute,
      routes: route,
      home: const MainMaterial(),
      debugShowCheckedModeBanner: false);

  final scope = ProviderScope(
    child: app,
  );
  runApp(scope);
}
