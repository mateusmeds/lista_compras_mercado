import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/pages/product_list_page.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_detail/pages/purchase_detail_page.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list/bloc/events/purchase_list_event.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list/bloc/purchase_list_bloc.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list/bloc/states/purchase_list_state.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list/widgets/purchase_card.dart';
import 'package:lista_compras_mercado/app/utils/functions.dart';

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
                      buildWhen: (_, state) {
                        return _buildBloc(state);
                      },
                      builder: (context, state) {
                        if (state is GetAllPurchasesLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is GetAllPurchasesEmptyState) {
                          return const Center(
                            child: Text('Você ainda não realizou uma compra.'),
                          );
                        }

                        if (state is GetAllPurchasesSuccessState) {
                          return ListView.builder(
                            itemCount: state.purchaseList.length,
                            itemBuilder: (context, index) {
                              PurchaseEntity purchase =
                                  state.purchaseList[index];
                              return PurchaseCard(
                                purchaseEntity: purchase,
                                onTap: () =>
                                    _navigateToPurchaseDetail(purchase),
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      listener: (context, state) {
                        if (state is DeletePurchaseSuccessState) {
                          _purchaseListBloc.add(GetAllPurchasesEvent());
                          showSuccessMessage(context,
                              'Sucesso! A lista de compras foi removida.');
                        }

                        if (state is DeletePurchaseErrorState) {
                          showErrorMessage(context,
                              'Erro! Ocorreu um erro ao tentar remover a lista de compras. Por favor, tente novamente.');
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: constraints.maxWidth * 0.8,
                    child: ElevatedButton(
                      onPressed: _navigateToProductListPage,
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

  bool _buildBloc(PurchaseListState state) {
    return state is GetAllPurchasesLoadingState ||
        state is GetAllPurchasesSuccessState ||
        state is GetAllPurchasesEmptyState;
  }

  _navigateToProductListPage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const ProductListPage();
    }));
  }

  _deletePurchase(int key) {
    _purchaseListBloc.add(DeletePurchaseEvent(key));
  }

  _navigateToPurchaseDetail(PurchaseEntity purchaseEntity) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return PurchaseDetailPage(
        purchaseEntity: purchaseEntity,
      );
    }));
  }
}
