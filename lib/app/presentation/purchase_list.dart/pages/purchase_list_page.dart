import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/pages/product_list_page.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list.dart/bloc/events/purchase_list_event.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list.dart/bloc/purchase_list_bloc.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list.dart/bloc/states/purchase_list_state.dart';

class PurchaseListPage extends StatefulWidget {
  const PurchaseListPage({Key? key}) : super(key: key);

  @override
  State<PurchaseListPage> createState() => _PurchaseListPageState();
}

class _PurchaseListPageState extends State<PurchaseListPage> {
  late PurchaseListBloc _purchaseListBloc;
  @override
  void initState() {
    _purchaseListBloc = GetIt.I.get<PurchaseListBloc>();
    _purchaseListBloc.add(GetAllPurchasesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SUAS COMPRAS'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: constraints.maxWidth * 0.8,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: BlocConsumer<PurchaseListBloc, PurchaseListState>(
                      bloc: _purchaseListBloc,
                      builder: (context, state) {
                        if (state is GetAllPurchasesLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is GetAllPurchasesSuccessState) {
                          List<PurchaseEntity> purchaseList =
                              state.purchaseList;
                          return ListView.builder(
                            itemCount: purchaseList.length,
                            itemBuilder: (context, index) {
                              PurchaseEntity purchase = purchaseList[index];
                              return Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: Card(
                                  child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10,
                                      ),
                                      title: Text(
                                        'Descrição',
                                        maxLines: 2,
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      subtitle: Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("${purchase.date}"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('R\$ ${purchase.totalValue}'),
                                          ],
                                        ),
                                      ),
                                      trailing: Icon(Icons.arrow_forward_ios)),
                                ),
                              );
                            },
                          );
                        }
                        return SizedBox.shrink();
                      },
                      listener: (context, state) {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: constraints.maxWidth * 0.8,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProductListPage();
                      })),
                      child: const Text('INICIAR COMPRA'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
