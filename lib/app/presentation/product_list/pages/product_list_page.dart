import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_compras_mercado/app/domain/entities/product_entity.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/bloc/product_list_cubit.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/pages/form_product_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late List<ProductEntity> _productEntityList;
  late ProductListCubit _productListCubit;
  @override
  void initState() {
    _productEntityList = [];
    _productListCubit = ProductListCubit(_productEntityList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return FormProductPage(_productListCubit);
              }));
            },
            icon: const Icon(Icons.add),
            splashRadius: 20,
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: SizedBox(
            width: constraints.maxWidth * 0.8,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: BlocBuilder<ProductListCubit, List<ProductEntity>>(
                    bloc: _productListCubit,
                    builder: (context, state) {
                      if (state.isEmpty) {
                        return Center(
                          child: Text('Nenhum item adicioando.'),
                        );
                      }
                      return ListView.builder(
                          itemCount: state.length,
                          itemBuilder: (context, index) {
                            ProductEntity productEntity = state[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Card(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 10,
                                  ),
                                  title: Text(
                                    productEntity.name,
                                    maxLines: 2,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  subtitle: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Preço: R\$ ${productEntity.price.toStringAsFixed(2)}'),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            'Total: R\$ ${productEntity.totalPrice.toStringAsFixed(2)}'),
                                      ],
                                    ),
                                  ),
                                  trailing: FittedBox(
                                    child: Column(
                                      children: [
                                        InkWell(
                                          child: const Icon(
                                            Icons.remove_circle_outline,
                                          ),
                                          onTap: () {
                                            _productListCubit
                                                .decrementProduct(index);
                                          },
                                        ),
                                        Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                                '${productEntity.quantity}')),
                                        InkWell(
                                          child: const Icon(
                                            Icons.add_circle,
                                            color: Colors.black,
                                          ),
                                          onTap: () {
                                            _productListCubit
                                                .incrementProduct(index);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
                BlocBuilder<ProductListCubit, List<ProductEntity>>(
                    bloc: _productListCubit,
                    builder: (context, state) {
                      return Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL'),
                            Text(
                                'R\$ ${_productListCubit.totalValue.toStringAsFixed(2)}'),
                          ],
                        ),
                      );
                    }),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  width: constraints.maxWidth * 0.8,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('FINALIZAR'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
