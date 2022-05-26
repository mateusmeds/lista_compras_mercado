// Define  um widget Form customizado
import 'package:flutter/material.dart';
import 'package:lista_compras_mercado/app/domain/entities/product_entity.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/bloc/product_list_cubit.dart';

class FormProductPage extends StatefulWidget {
  const FormProductPage(this.productListCubit, {Key? key}) : super(key: key);
  final ProductListCubit productListCubit;
  @override
  FormProductPageState createState() => FormProductPageState();
}

class FormProductPageState extends State<FormProductPage> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late double price;
  late int quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Item'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: constraints.maxWidth * 0.8,
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Nome',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nome vazio!';
                          }
                          if (value.length < 3) {
                            return 'O nome deve ter pelo menos 3 caracteres';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name = value!;
                        },
                      ),
                      TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(hintText: 'Preço'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Preço vazio!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          price = double.parse(value!);
                        },
                      ),
                      TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration:
                            const InputDecoration(hintText: 'Quantidade'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Quantidade vazia!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          quantity = int.parse(value!);
                        },
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              widget.productListCubit.add(ProductEntity(
                                  name: name,
                                  price: price,
                                  quantity: quantity));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text('Sucesso! O Produto foi adicionado.'),
                                backgroundColor: Colors.green,
                              ));
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('SALVAR'),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
