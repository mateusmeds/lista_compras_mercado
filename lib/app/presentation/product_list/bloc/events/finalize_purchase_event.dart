import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';

abstract class FinalizePurchaseEvent {}

class SavePurchaseEvent extends FinalizePurchaseEvent {
  SavePurchaseEvent(this.purchaseEntity);

  final PurchaseEntity purchaseEntity;
}
