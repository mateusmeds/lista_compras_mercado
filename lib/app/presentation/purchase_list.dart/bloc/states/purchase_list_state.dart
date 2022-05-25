import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';

abstract class PurchaseListState {}

class GetAllPurchasesStartState extends PurchaseListState {}

class GetAllPurchasesLoadingState extends PurchaseListState {}

class GetAllPurchasesSuccessState extends PurchaseListState {
  GetAllPurchasesSuccessState(this.purchaseList);

  List<PurchaseEntity> purchaseList;
}

class GetAllPurchasesErrorState extends PurchaseListState {}
