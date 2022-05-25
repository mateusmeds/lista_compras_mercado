import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/pages/product_list_page.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list.dart/pages/purchase_list_page.dart';
import 'package:lista_compras_mercado/app/utils/inject_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await InjectDependencies.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PurchaseListPage(),
    );
  }
}
